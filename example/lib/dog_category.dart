import 'package:db_sql_query/db_sql_query.dart';
import 'package:example/config_sqflite.dart';

class DogCategory extends ITable {
  final int id;
  final String name;

  DogCategory({
    this.id = 0,
    required this.name,
  });

  factory DogCategory.fromJson(Map<String, dynamic> json) => DogCategory(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };
}

class _DogCategoryId extends IColumn<DogCategory> {
  const _DogCategoryId() : super('id', tableName: 'dog_categories');
}

class $DogCategoryName extends IColumn<DogCategory> {
  const $DogCategoryName() : super('name', tableName: 'dog_categories');
}

const dogCategoryId = _DogCategoryId();
const dogCategoryName = $DogCategoryName();

extension DogCategoryQuery on DogCategory {
  static String get name => 'dog_categories';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY autoincrement',
          'name TEXT NOT NULL',
        ],
      );

  static Future<List<E>>
      rawQuery<E, T extends IColumn<DogCategory>, F, TF extends IColumn<F>>({
    List<T> select = const [],
    List<T> groupBy = const [],
    List<T> oderByByHaving = const [],
    List<T> where = const [],
    List<T> orderBy = const [],
    List<T> having = const [],
    List<TF> innerJoin = const [],
    List<TF> leftJoin = const [],
    int? limit,
    int offset = 0,
    required E Function(Map<String, Object?>) parser,
    bool logQuery = true,
  }) =>
          ExtraQuery.instance.rawQuery<E, DogCategory, T, F, TF>(
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

  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        map: toMap(),
      );

  Future<void> insertAuto() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [dogCategoryName.str],
        values: [name],
      );

  static Future<List<DogCategory>> find() =>
      ExtraQuery.instance.find<DogCategory>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => DogCategory.fromJson(e),
      );

  static Future<DogCategory?> findOne() =>
      ExtraQuery.instance.findOne<DogCategory>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => DogCategory.fromJson(e),
      );

  static Future<DogCategory?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, DogCategory, IColumn<DogCategory>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(dogCategoryId, id),
        parser: (e) => DogCategory.fromJson(e),
      );

  Future<void> update() =>
      ExtraQuery.instance.update<int, DogCategory, IColumn<DogCategory>>(
        name,
        ConfigSqflite.instance.database,
        map: toMap(),
        IdValue(dogCategoryId, id),
      );

  Future<void> delete() =>
      ExtraQuery.instance.delete<int, DogCategory, IColumn<DogCategory>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(dogCategoryId, id),
      );
}
