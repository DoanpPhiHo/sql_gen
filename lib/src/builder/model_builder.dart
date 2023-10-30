import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/extensions/extensions.dart';
import 'package:source_gen/source_gen.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class ModelGenerator extends GeneratorForAnnotation<ModelSql> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final lstClassBuilder = _buildListClass(element);

    final className = annotation.peek('name')?.stringValue;
    final exName = '${element.displayName}Query';
    final extensionBuilder = Extension((e) {
      e
        ..on = refer(element.displayName)
        ..name = exName
        ..methods.addAll(_buildExtensions(element, className, exName))
        ..fields.addAll([]);
    });

    final functionFromJsonBuilder = _buildMethodFromJson(element, className);

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      for (final s in lstClassBuilder) s.accept(emitter),
      extensionBuilder.accept(emitter),
      functionFromJsonBuilder.accept(emitter),
    ].join('\n\n'));
  }

  List<Class> _buildListClass(Element element) {
    try {
      if (element is! ClassElement) throw Exception('not class');
      final eClass = element;
      final fields = eClass.fields;
      final className = eClass.displayName;

      final primaryKeyBuilder = fields.primaryKeyField(className);

      final columns = fields.columnFields(className);

      final enums = fields.enumFields(className);

      final indexLst = fields.indexFields(className);

      final fs = [
        if (primaryKeyBuilder != null) primaryKeyBuilder,
        ...columns,
        ...enums,
        ...indexLst,
      ];
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

  List<Method> _buildExtensions(
      Element element, String? tableName, String extensionName) {
    try {
      if (element is! ClassElement) throw Exception('not class');

      /// class Table
      final eClass = element;

      /// fields in class Table
      final fields = eClass.fields.cast<FieldElement>();

      /// class name
      final className = element.displayName;

      /// table name
      final eTableName = tableName ?? className.underscore;

      final primaryKeyBuilder = fields.primaryKeyField(className);

      final columns = fields.columnFields(className);

      final enums = fields.enumFields(className);

      final indexLst = fields.indexFields(className);

      final fs = [
        if (primaryKeyBuilder != null) primaryKeyBuilder,
        ...columns,
        ...enums,
        ...indexLst,
      ];
      final fsInsert = [
        ...columns,
        ...enums,
        ...indexLst,
      ];

      return [
        //#region ================= name =====================
        Method(
          (f) => f
            ..name = 'name'
            ..type = MethodType.getter
            ..static = true
            ..lambda = true
            ..returns = refer('String')
            ..body = Code('\'$eTableName\''),
        ),
        //#endregion ================= name =====================
        //#region ================= fields =====================
        for (final field in fs)
          Method(
            (f) => f
              ..name = field.nameClassConst
              ..type = MethodType.getter
              ..static = true
              ..lambda = true
              ..returns = refer('IColumn<$className>')
              ..body = Code(
                  'const ${field.nameClass}(\'${field.name}\',tableName:\'$eTableName\')'),
          ),
        //#endregion ================= name =====================
        //#region ================= rawCreate =====================
        Method(
          (f) => f
            ..name = 'rawCreate'
            ..type = MethodType.getter
            ..lambda = true
            ..static = true
            ..returns = refer('String')
            ..body = Code(
              '''ExtraQuery.instance.createTable(
                name,
                fields:[
                ${[for (final f in fs) '\'${f.name} ${f.param}\''].join(',')}
              ],)''',
            ),
        ),
        //#endregion ================= rawCreateTable =====================
        //#region ================= delete =====================
        if (primaryKeyBuilder != null)
          Method(
            (f) => f
              ..name = 'delete'
              ..lambda = true
              ..returns = refer('Future<void>')
              ..body = Code(
                '''ExtraQuery.instance.delete<int, $className, IColumn<$className>>(
                name,
                ConfigSqflite.instance.database,
                IdValue(${primaryKeyBuilder.nameClassConst}, ${primaryKeyBuilder.name}),
              )''',
              ),
          ),
        //#endregion ================= delete =====================
        //#region ================= toMapFromDB =====================
        Method(
          (f) => f
            ..name = 'toMapFromDB'
            ..lambda = true
            ..returns = refer('Map<String,dynamic>')
            ..body = Code(
              '''{
                ${[
                for (final s in fs)
                  '\'${s.name}\':${s.toJson != null ? '${s.toJson}(${s.name})' : s.name}'
              ].join(',')}
              }''',
            ),
        ),
        //#endregion ================= update =====================
        //#region ================= update =====================
        if (primaryKeyBuilder != null)
          Method(
            (f) => f
              ..name = 'update'
              ..lambda = true
              ..returns = refer('Future<void>')
              ..body = Code(
                '''ExtraQuery.instance.update<int, $className, IColumn<$className>>(
                name,
                ConfigSqflite.instance.database,
                map: toMapFromDB(),
                IdValue(${primaryKeyBuilder.nameClassConst}, ${primaryKeyBuilder.name}),
              )''',
              ),
          ),
        //#endregion ================= update =====================
        //#region ================= findOneById =====================
        if (primaryKeyBuilder != null)
          Method(
            (f) => f
              ..name = 'findOneById'
              ..lambda = true
              ..static = true
              ..returns = refer('Future<$className?>')
              ..requiredParameters.add(
                Parameter(
                  (p) {
                    p
                      ..name = 'id'
                      ..type = refer('int');
                  },
                ),
              )
              ..body = Code(
                '''ExtraQuery.instance.findOneById<int, $className, IColumn<$className>>(
                name,
                ConfigSqflite.instance.database,
                IdValue(${primaryKeyBuilder.nameClassConst}, ${primaryKeyBuilder.name}),
                parser: (e) => $className.fromJsonDB(e),
              )''',
              ),
          ),
        //#endregion ================= findOneById =====================
        //#region ================= findOne =====================
        Method(
          (f) => f
            ..name = 'findOne'
            ..lambda = true
            ..static = true
            ..returns = refer('Future<$className?>')
            ..body = Code(
              '''ExtraQuery.instance.findOne<$className>(
                name,
                ConfigSqflite.instance.database,
                parser: (e) => $className.fromJsonDB(e),
              )''',
            ),
        ),
        //#endregion ================= findOne =====================
        //#region ================= find =====================
        Method(
          (f) => f
            ..name = 'find'
            ..lambda = true
            ..static = true
            ..returns = refer('Future<List<$className>>')
            ..body = Code(
              '''ExtraQuery.instance.find<$className>(
                name,
                ConfigSqflite.instance.database,
                parser: (e) => $className.fromJsonDB(e),
              )''',
            ),
        ),
        //#endregion ================= find =====================
        //#region ================= insertAuto =====================
        if (primaryKeyBuilder?.isAuto == true)
          Method(
            (f) => f
              ..name = 'insert'
              ..lambda = true
              ..returns = refer('Future<void>')
              ..body = Code(
                '''ExtraQuery.instance.insert(
                name,
                ConfigSqflite.instance.database,
                fields: [
                  ${[
                  for (final s in fsInsert)
                    '$extensionName.${s.nameClassConst}.str'
                ].join(',')}
                ],
                values: [
                  ${[for (final s in fsInsert) s.name].join(',')}
                ],
              )''',
              ),
          ),
        //#endregion ================= insertAuto =====================
        //#region ================= insert =====================
        if (primaryKeyBuilder?.isAuto == false)
          Method(
            (f) => f
              ..name = 'insert'
              ..lambda = true
              ..returns = refer('Future<void>')
              ..body = Code(
                '''ExtraQuery.instance.insert(
                name,
                ConfigSqflite.instance.database,
                map: toMapFromDB(),
              )''',
              ),
          ),
        //#endregion ================= insert =====================
        //#region ================= rawQuery =====================
        Method(
          (f) => f
            ..name =
                'rawQuery<E,T extends IColumn<$className>, F, TF extends IColumn<F>>'
            ..lambda = true
            ..static = true
            ..returns = refer('Future<List<E>>')
            ..optionalParameters.addAll([
              Parameter(
                (p) {
                  p
                    ..name = 'select'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<T>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'groupBy'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<T>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'oderByByHaving'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<T>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'where'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<T>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'orderBy'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<T>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'having'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<T>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'innerJoin'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<TF>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'leftJoin'
                    ..named = true
                    ..defaultTo = Code('const []')
                    ..type = refer('List<TF>');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'offset'
                    ..named = true
                    ..defaultTo = Code('0')
                    ..type = refer('int');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'limit'
                    ..named = true
                    ..required = false
                    ..type = refer('int?');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'parser'
                    ..named = true
                    ..required = true
                    ..type = refer('E Function(Map<String, Object?>)');
                },
              ),
              Parameter(
                (p) {
                  p
                    ..name = 'logQuery'
                    ..named = true
                    ..required = false
                    ..defaultTo = Code('true')
                    ..type = refer('bool');
                },
              ),
            ])
            ..body = Code(
              '''ExtraQuery.instance.rawQuery<E, $className, T, F, TF>(
                name,
                ConfigSqflite.instance.database,
                parser: parser, groupBy: groupBy,
                having: having, innerJoin: innerJoin, leftJoin: leftJoin,
                limit: limit, logQuery: logQuery, oderByByHaving: oderByByHaving,
                offset: offset, orderBy: orderBy, select: select, where: where,
              )''',
            ),
        ),
        //#endregion ================= rawQuery =====================
        //#region ================= rawDropTable =====================
        Method((f) => f
          ..name = 'rawDropTable'
          ..static = true
          ..lambda = true
          ..type = MethodType.getter
          ..returns = refer('String')
          ..body = Code('\'DROP TABLE IF EXISTS $tableName\'')),
        //#endregion ================= rawDropTable =====================
      ];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Method _buildMethodFromJson(Element element, String? tableName) {
    try {
      if (element is! ClassElement) throw Exception('not class');

      /// class Table
      final eClass = element;

      /// fields in class Table
      final fields = eClass.fields.cast<FieldElement>();

      /// class name
      final className = element.displayName;

      final primaryKeyBuilder = fields.primaryKeyField(className);

      final columns = fields.columnFields(className);

      final enums = fields.enumFields(className);

      final indexLst = fields.indexFields(className);

      final valueDefaults = _buildField(element);

      final fs = [
        if (primaryKeyBuilder != null) primaryKeyBuilder,
        ...columns,
        ...enums,
        ...indexLst,
      ];

      return Method((m) {
        m
          ..name = '\$${className}FromJsonDB'
          ..lambda = true
          ..body = Code('''
            $className(
              ${[
            for (final s in fs)
              '''${s.name}:${s.fromJsonStr} ${s.valueStr(valueDefaults)}'''
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

  Map<String, dynamic> _buildField(Element element) {
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
