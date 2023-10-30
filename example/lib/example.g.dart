// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// EnumGenerator
// **************************************************************************

// ignore_for_file:

Sex? $fromJsonSex(String? name) {
  if (name == null) return null; //Sex.values[0];
  return Sex.values.byName(name);
}

String? $toJsonSex(Sex? value) {
  return value?.name;
}

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _ExampleModelId extends IColumn<ExampleModel> {
  const _ExampleModelId(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelPassportId extends IColumn<ExampleModel> {
  const _ExampleModelPassportId(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelAge extends IColumn<ExampleModel> {
  const _ExampleModelAge(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelRegion extends IColumn<ExampleModel> {
  const _ExampleModelRegion(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelSex extends IColumn<ExampleModel> {
  const _ExampleModelSex(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelName extends IColumn<ExampleModel> {
  const _ExampleModelName(
    super.str, {
    super.tableName,
  });
}

extension ExampleModelField on ExampleModel {
  static const IColumn<ExampleModel> exampleModelId =
      _ExampleModelId('id', tableName: 'example');

  static const IColumn<ExampleModel> exampleModelPassportId =
      _ExampleModelPassportId('passportId', tableName: 'example');

  static const IColumn<ExampleModel> exampleModelAge =
      _ExampleModelAge('age', tableName: 'example');

  static const IColumn<ExampleModel> exampleModelRegion =
      _ExampleModelRegion('region', tableName: 'example');

  static const IColumn<ExampleModel> exampleModelSex =
      _ExampleModelSex('sex', tableName: 'example');

  static const IColumn<ExampleModel> exampleModelName =
      _ExampleModelName('name', tableName: 'example');
}

ExampleModel $ExampleModelFromJsonDB(Map<String, dynamic> json) => ExampleModel(
    id: json['id'] as int,
    passportId: json['passportId'] as String,
    age: json['age'] as int? ?? 10,
    region: json['region'] as int? ?? 4454,
    sex: $fromJsonSex(json['sex'] as String?) ?? Sex.male,
    name: json['name'] as String);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension ExampleModelQuery on ExampleModel {
  static String get name => 'example';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'passportId TEXT NOT NULL',
          'age INTEGER',
          'region INTEGER',
          'sex TEXT',
          'name TEXT NOT NULL',
        ],
      );
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, ExampleModel, IColumn<ExampleModel>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(exampleModelId, id),
      );
  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'passportId': passportId,
        'age': age,
        'region': region,
        'sex': $toJsonSex(sex),
        'name': name
      };
  Future<void> update() =>
      ExtraQuery.instance.update<int, ExampleModel, IColumn<ExampleModel>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(exampleModelId, id),
      );
  static Future<ExampleModel?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, ExampleModel, IColumn<ExampleModel>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(exampleModelId, id),
        parser: (e) => ExampleModel.fromJsonDB(e),
      );
  static Future<ExampleModel?> findOne() =>
      ExtraQuery.instance.findOne<ExampleModel>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => ExampleModel.fromJsonDB(e),
      );
  static Future<List<ExampleModel>> find() =>
      ExtraQuery.instance.find<ExampleModel>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => ExampleModel.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          ExampleModelField.exampleModelPassportId.str,
          ExampleModelField.exampleModelAge.str,
          ExampleModelField.exampleModelRegion.str,
          ExampleModelField.exampleModelSex.str,
          ExampleModelField.exampleModelName.str
        ],
        values: [passportId, age, region, sex, name],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<ExampleModel>, F, TF extends IColumn<F>>({
    List<T> select = const [],
    List<T> groupBy = const [],
    List<T> oderByByHaving = const [],
    List<T> where = const [],
    List<T> orderBy = const [],
    List<T> having = const [],
    List<TF> innerJoin = const [],
    List<TF> leftJoin = const [],
    int offset = 0,
    int? limit,
    required E Function(Map<String, Object?>) parser,
    bool logQuery = true,
  }) =>
          ExtraQuery.instance.rawQuery<E, ExampleModel, T, F, TF>(
            name,
            ConfigSqflite.instance.database,
            parser: parser,
            groupBy: groupBy,
            having: having,
            innerJoin: innerJoin,
            leftJoin: leftJoin,
            limit: limit,
            logQuery: logQuery,
            oderByByHaving: oderByByHaving,
            offset: offset,
            orderBy: orderBy,
            select: select,
            where: where,
          );
  static String get rawDropTable => ExtraQuery.instance.dropTable(name);
}
