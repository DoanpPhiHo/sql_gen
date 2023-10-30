// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

class _DogId extends IColumn<Dog> {
  const _DogId(
    super.str, {
    super.tableName,
  });
}

class _DogName extends IColumn<Dog> {
  const _DogName(
    super.str, {
    super.tableName,
  });
}

class _DogAge extends IColumn<Dog> {
  const _DogAge(
    super.str, {
    super.tableName,
  });
}

class _DogCategory extends IColumn<Dog> {
  const _DogCategory(
    super.str, {
    super.tableName,
  });
}

extension DogQuery on Dog {
  static String get name => 'dog';
  static IColumn<Dog> get dogId => const _DogId('id', tableName: 'dog');
  static IColumn<Dog> get dogName => const _DogName('name', tableName: 'dog');
  static IColumn<Dog> get dogAge => const _DogAge('age', tableName: 'dog');
  static IColumn<Dog> get dogCategory =>
      const _DogCategory('category', tableName: 'dog');
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'name TEXT NOT NULL',
          'age INTEGER',
          'category INTEGER NOT NULL'
        ],
      );
  Future<void> delete() => ExtraQuery.instance.delete<int, Dog, IColumn<Dog>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(dogId, id),
      );
  Map<String, dynamic> toMapFromDB() =>
      {'id': id, 'name': name, 'age': age, 'category': category};
  Future<void> update() => ExtraQuery.instance.update<int, Dog, IColumn<Dog>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(dogId, id),
      );
  static Future<Dog?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Dog, IColumn<Dog>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(dogId, id),
        parser: (e) => Dog.fromJsonDB(e),
      );
  static Future<Dog?> findOne() => ExtraQuery.instance.findOne<Dog>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Dog.fromJsonDB(e),
      );
  static Future<List<Dog>> find() => ExtraQuery.instance.find<Dog>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Dog.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          DogQuery.dogName.str,
          DogQuery.dogAge.str,
          DogQuery.dogCategory.str
        ],
        values: [name, age, category],
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
    int offset = 0,
    int? limit,
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
  static String get rawDropTable => 'DROP TABLE IF EXISTS null';
}

Dog $DogFromJsonDB(Map<String, dynamic> json) => Dog(
    id: json['id'] as int ?? 0,
    name: json['name'] as String,
    age: json['age'] as int?,
    category: json['category'] as int);
