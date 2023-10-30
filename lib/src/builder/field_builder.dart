import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/extensions/extensions.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

import 'config_checked.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class FieldGenerator extends GeneratorForAnnotation<ModelSql> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    //#region ==================== read file check ==============================
    final injectableConfigFiles = Glob("**/**.sql_model.json");
    final jsonData = <Map>[];
    await for (final id in buildStep.findAssets(injectableConfigFiles)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      jsonData.addAll([...json]);
    }
    final configs = jsonData.map((e) => ModelConfigGen.fromJson(e)).toList();
    //#endregion ================= read file check ==============================
    //#region ================= read annotation ==============================
    if (element is! ClassElement) throw Exception('not class');
    final eClass = element;
    final fields = eClass.fields;
    final className = eClass.displayName;
    final tableName = annotation.peek('name')?.stringValue;
    final eTableName = tableName ?? className.underscore;

    final primaryKeyBuilder = fields.primaryKeyField(className);

    final columns = fields.columnFields(className);

    final enums = fields.enumFields(className);

    final indexLst = fields.indexFields(className);
    final foreign = fields.foreignFields(className, configs);

    final fs = [
      if (primaryKeyBuilder != null) primaryKeyBuilder,
      ...columns,
      ...enums,
      ...indexLst,
      ...foreign,
    ];
    //#endregion ================= read annotation =============================

    final valueDefaults = getDefaultValue(element);

    final lstClassBuilder = _buildListClass(fs, className);

    final exName = '${element.displayName}Field';
    final extensionBuilder = Extension((e) {
      e
        ..on = refer(element.displayName)
        ..name = exName
        ..fields.addAll(_buildField(fs, className, eTableName));
    });

    final functionFromJsonBuilder =
        _buildMethodFromJson(fs, className, valueDefaults);

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      for (final s in lstClassBuilder) s.accept(emitter),
      extensionBuilder.accept(emitter),
      functionFromJsonBuilder.accept(emitter),
    ].join('\n\n'));
  }

  List<Class> _buildListClass(List<CBuilder> fs, String className) {
    try {
      return fs
          .map((e) => Class((c) {
                c
                  ..name = e.nameClass
                  ..extend = Reference('IColumn<$className>')
                  ..constructors.add(Constructor((cb) {
                    cb
                      ..constant = true
                      ..requiredParameters.add(
                        Parameter(
                          (p) {
                            p
                              ..name = 'str'
                              ..toSuper = true;
                          },
                        ),
                      )
                      ..optionalParameters.add(
                        Parameter(
                          (p) {
                            p
                              ..name = 'tableName'
                              ..required = false
                              ..named = true
                              ..toSuper = true;
                          },
                        ),
                      );
                  }));
              }))
          .toList();
    } catch (e) {
      print(e);
    }
    return [];
  }

  List<Field> _buildField(
      List<CBuilder> fs, String className, String eTableName) {
    try {
      return [
        //#region ================= fields =====================
        for (final field in fs)
          Field(
            (f) => f
              ..name = field.nameClassConst
              ..static = true
              ..type = refer('const IColumn<$className>')
              ..assignment = Code(
                  '${field.nameClass}(\'${field.name}\',tableName:\'$eTableName\')'),
          ),
        //#endregion ================= fields =====================
      ];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Method _buildMethodFromJson(
    List<CBuilder> fs,
    String className,
    Map<String, dynamic> valueDefaults,
  ) {
    try {
      return Method((m) {
        m
          ..name = '\$${className}FromJsonDB'
          ..lambda = true
          ..body = Code('''
            $className(
              ${[
            for (final s in fs) '''${s.name}:${s.fromJsonStr(valueDefaults)}'''
          ].join(',')}
            );''')
          ..requiredParameters.add(Parameter((p) {
            p
              ..name = 'json'
              ..type = refer('Map<String,dynamic>');
          }))
          ..returns = refer(className);
      });
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> getDefaultValue(Element element) {
    try {
      if (element is! ClassElement) throw Exception('not class');
      final eClass = element;
      final fields =
          eClass.constructors.first.children.cast<ParameterElement>();
      return {
        for (final field in fields) field.displayName: field.defaultValueCode
      };
    } catch (e) {
      return {};
    }
  }
}
