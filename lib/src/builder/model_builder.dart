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
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) return;
    final gBuilder =
        await ClassGBuilder.fromElement(element, annotation, buildStep);

    final exName = '${element.displayName}Query';
    final extensionBuilder = Extension((e) {
      e
        ..on = refer(element.displayName)
        ..name = exName
        ..fields.addAll([
          for (final field in gBuilder.all)
            Field(
              (f) => f
                ..name = field.nameClassConst
                ..static = true
                ..type = refer('const IColumn<${gBuilder.className}>')
                ..assignment = Code(
                    '${field.nameClass}(\'${field.nameSql}\',tableName:\'${gBuilder.tName}\')'),
            ),
        ])
        ..methods.add(
          Method(
            (f) => f
              ..name = 'toMapFromDB'
              ..lambda = true
              ..returns = refer('Map<String,dynamic>')
              ..body = Code(
                '''{
                ${[for (final s in gBuilder.all) s.rawToJson].join(',')}
              }''',
              ),
          ),
        )
        ..methods.add(
          Method(
            (f) => f
              ..name = 'rawCreate'
              ..type = MethodType.getter
              ..lambda = true
              ..static = true
              ..docs.addAll([])
              ..returns = refer('String')
              ..body = Code(
                '''ExtraQuery.instance.createTable(
                name,
                fields:[
                ${[
                  for (final f in gBuilder.all) '\'${f.rawCreate}\'',
                  for (final f in gBuilder.foreign) '\'${f.foreignStr}\''
                ].join(',')}
              ],)''',
              ),
          ),
        )
        ..methods.add(
          Method(
            (f) => f
              ..name = 'name'
              ..type = MethodType.getter
              ..static = true
              ..lambda = true
              ..returns = refer('String')
              ..body = Code('\'${gBuilder.tName}\''),
          ),
        )
        ..methods.addAll(_buildExtensions(gBuilder));
    });

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      extensionBuilder.accept(emitter),
    ].join('\n\n'));
  }

  List<Method> _buildExtensions(ClassGBuilder gBuilder) {
    try {
      return [
        //#region ================= delete =====================
        if (gBuilder.primaryKey != null)
          Method(
            (f) => f
              ..name = 'delete'
              ..lambda = true
              ..returns = refer('Future<void>')
              ..body = Code(
                '''ExtraQuery.instance.delete<int, ${gBuilder.className}, IColumn<${gBuilder.className}>>(
                name,
                ConfigSqflite.instance.database,
                IdValue(${gBuilder.primaryKey!.nameClassConst}, ${gBuilder.primaryKey!.fieldName}),
              )''',
              ),
          ),
        //#endregion ================= delete =====================
        //#region ================= update =====================
        if (gBuilder.primaryKey != null)
          Method(
            (f) => f
              ..name = 'update'
              ..lambda = true
              ..returns = refer('Future<void>')
              ..body = Code(
                '''ExtraQuery.instance.update<int, ${gBuilder.className}, IColumn<${gBuilder.className}>>(
                name,
                ConfigSqflite.instance.database,
                map: toMapFromDB(),
                IdValue(${gBuilder.primaryKey!.nameClassConst}, ${gBuilder.primaryKey!.fieldName}),
              )''',
              ),
          ),
        //#endregion ================= update =====================
        //#region ================= findOneById =====================
        if (gBuilder.primaryKey != null)
          Method(
            (f) => f
              ..name = 'findOneById'
              ..lambda = true
              ..static = true
              ..returns = refer('Future<${gBuilder.className}?>')
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
                '''ExtraQuery.instance.findOneById<int, ${gBuilder.className}, IColumn<${gBuilder.className}>>(
                name,
                ConfigSqflite.instance.database,
                IdValue(${gBuilder.primaryKey!.nameClassConst}, id),
                parser: (e) => ${gBuilder.className}.fromJsonDB(e),
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
            ..returns = refer('Future<${gBuilder.className}?>')
            ..body = Code(
              '''ExtraQuery.instance.findOne<${gBuilder.className}>(
                name,
                ConfigSqflite.instance.database,
                parser: (e) => ${gBuilder.className}.fromJsonDB(e),
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
            ..returns = refer('Future<List<${gBuilder.className}>>')
            ..body = Code(
              '''ExtraQuery.instance.find<${gBuilder.className}>(
                name,
                ConfigSqflite.instance.database,
                parser: (e) => ${gBuilder.className}.fromJsonDB(e),
              )''',
            ),
        ),
        //#endregion ================= find =====================
        //#region ================= insertAuto =====================
        if (gBuilder.primaryKey?.autoId == true)
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
                  for (final s in gBuilder.allWithOutPrimary)
                    '${gBuilder.extensionName}.${s.nameClassConst}.str'
                ].join(',')}
                ],
                values: [
                  ${[
                  for (final s in gBuilder.allWithOutPrimary) s.to
                ].join(',')}
                ],
              )''',
              ),
          ),
        //#endregion ================= insertAuto =====================
        //#region ================= insert =====================
        if (gBuilder.primaryKey?.autoId == false)
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
                'rawQuery<E,T extends IColumn<${gBuilder.className}>, F, TF extends IColumn<F>>'
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
              '''ExtraQuery.instance.rawQuery<E, ${gBuilder.className}, T, F, TF>(
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
          ..body = Code('ExtraQuery.instance.dropTable(name)')),
        //#endregion ================= rawDropTable =====================
      ];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
