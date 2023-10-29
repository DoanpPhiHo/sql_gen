import 'package:db_sql_query/db_sql_query.dart';

import 'config_sqflite.dart';

class Dog extends ITable {
  final int id;
  final String name;
  final int? age;
  final int category;

  Dog({
    this.id = 0,
    required this.name,
    this.age,
    required this.category,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        age: json['age'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        category: json['category'] as int,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
        'category': category,
      };
}

class _DogId extends IColumn<Dog> {
  const _DogId(super.str,
      {super.tableName}); // : super('id', tableName: 'dogs');
}

class _DogName extends IColumn<Dog> {
  const _DogName() : super('name', tableName: 'dogs');
}

class _DogCategory extends IColumn<Dog> {
  const _DogCategory() : super('category', tableName: 'dogs');
}

class _DogAge extends IColumn<Dog> {
  const _DogAge() : super('age', tableName: 'dogs');
}

const dogId = _DogId('id', tableName: 'dogs');
const dogName = _DogName();
const dogAge = _DogAge();
const dogCategory = _DogCategory();

extension DogQuery on Dog {
  static String get name => 'dogs';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY autoincrement',
          'name TEXT NOT NULL',
          'age INTEGER',
          'category INTEGER NOT NULL',
        ],
      );

  static Future<List<E>>
      rawQuery<E, T extends IColumn<Dog>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Dog, T, F, TF>(
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
        fields: [dogName.str, dogAge.str, dogCategory.str],
        values: [name, age, category],
      );

  static Future<List<Dog>> find() => ExtraQuery.instance.find<Dog>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Dog.fromJson(e),
      );

  static Future<Dog?> findOne() => ExtraQuery.instance.findOne<Dog>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Dog.fromJson(e),
      );

  static Future<Dog?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Dog, IColumn<Dog>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(dogId, id),
        parser: (e) => Dog.fromJson(e),
      );

  Future<void> update() => ExtraQuery.instance.update<int, Dog, IColumn<Dog>>(
        name,
        ConfigSqflite.instance.database,
        map: toMap(),
        IdValue(dogId, id),
      );

  Future<void> delete() => ExtraQuery.instance.delete<int, Dog, IColumn<Dog>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(dogId, id),
      );
}
