import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/extensions.dart';
import 'package:source_gen/source_gen.dart';

const _analyzerIgnores =
    '// ignore_for_file: no_leading_underscores_for_local_identifiers';

class ModelGenerator extends GeneratorForAnnotation<ModelSql> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final classBuilder = Class(
      (c) {
        c
          ..name = '_${element.displayName}'
          ..implements.addAll([refer(element.displayName)])
          ..constructors.addAll(_buildConstructors(element))
          ..fields.addAll(_buildField(element));
      },
    );

    final extensionBuilder = Extension((e) {
      e
        ..on = refer(element.displayName)
        ..name = '${element.displayName}Query'
        ..methods.addAll(_buildExtensions(element))
        ..fields.addAll([]);
    });

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      classBuilder.accept(emitter),
      extensionBuilder.accept(emitter),
    ].join('\n\n'));
  }

  List<Field> _buildField(Element element) {
    try {
      if (element is! ClassElement) throw Exception('not class');
      final eClass = element;
      final fields =
          eClass.constructors.first.children.cast<ParameterElement>();
      return [
        for (final field in fields)
          Field((f) => f
                ..name = field.name
                ..type = refer(field.type.toString())
                ..modifier = FieldModifier.final$
              // ..assignment = Code('_${field.name}Name'),
              )
      ];
    } catch (e) {
      return [];
    }
  }

  List<Method> _buildExtensions(Element element) {
    try {
      if (element is! ClassElement) throw Exception('not class');
      final eClass = element;
      final fields =
          eClass.constructors.first.children.cast<ParameterElement>();

      final tableName = element.displayName;

      return [
        //#region ================= rawCreateTable =====================
        Method(
          (f) => f
            ..name = 'rawCreateTable'
            ..static = true
            ..body = Code('''
return \'\'\'CREATE TABLE $tableName (
      ${fields.fieldsName.join(', \n\t\t\t')}
    )\'\'\';'''),
        ),
        //#endregion ================= rawCreateTable =====================
        //#region ================= rawDropTable =====================
        Method(
          (f) => f
            ..name = 'rawDropTable'
            ..static = true
            ..body = Code('''
return 'DROP TABLE IF EXISTS $tableName';'''),
        ),
        //#endregion ================= rawDropTable =====================
        //#region ================= rawSelectAll =====================
        Method(
          (f) => f
            ..name = 'rawSelectAll'
            ..static = true
            ..body = Code('''return 'SELECT * FROM $tableName';'''),
        ),
        //#endregion ================= rawSelectAll =====================
        //#region ================= rawSelectAll =====================
        Method(
          (f) => f
            ..name = 'rawDeleteByID'
            ..static = true
            ..requiredParameters.add(Parameter(
              (p) => p
                ..name = 'id'
                ..type = fields.primary?.type != null
                    ? refer(fields.primary!.type.toString())
                    : null,
            ))
            ..body =
                Code('''return 'DELETE * FROM $tableName where id = \$id';'''),
        ),
        //#endregion ================= rawSelectAll =====================
      ];
    } catch (e) {
      return [];
    }
  }

  List<Constructor> _buildConstructors(Element element) {
    try {
      if (element is! ClassElement) throw Exception('not class');
      final eClass = element;
      final constructor = eClass.constructors.first;
      return [_buildConstructor(constructor)];
    } catch (e) {
      return [];
    }
  }

  Constructor _buildConstructor(ConstructorElement constructor) {
    final params = constructor.children.cast<ParameterElement>();
    final c = Constructor((c) => c
      ..requiredParameters.addAll([
        for (final i in params.where((e) => !e.isNamed))
          Parameter(
            (p) {
              p
                ..name = i.displayName
                ..toThis = true;
            },
          )
      ])
      ..optionalParameters.addAll([
        for (final i in params.where((e) => e.isNamed))
          Parameter(
            (p) {
              p
                ..name = i.displayName
                ..required = i.isRequiredByParam
                ..named = true
                ..toThis = true
                ..defaultTo = i.value;
            },
          )
      ]));
    return c;
  }
}
