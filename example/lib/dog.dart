import 'dart:developer';

import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:example/config_sqflite.dart';
import 'package:sqflite/sql.dart';

class Dog {
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

class _DogId extends ITableProperties<Dog> {
  const _DogId() : super('id');
}

class _DogName extends ITableProperties<Dog> {
  const _DogName() : super('name');
}

class _DogCategory extends ITableProperties<Dog> {
  const _DogCategory() : super('category');
}

class _DogAge extends ITableProperties<Dog> {
  const _DogAge() : super('age');
}

const dogId = _DogId();
const dogName = _DogName();
const dogAge = _DogAge();
const dogCategory = _DogCategory();

extension DogQuery on Dog {
  static String get rawCreate => '''CREATE TABLE IF NOT EXISTS dogs(
          id INTEGER PRIMARY KEY autoincrement,
          name TEXT NOT NULL,
          age INTEGER,
          category INTEGER NOT NULL
        )''';

  // TODO(hodoan): FUTURE ```JOIN table ON```
  static Future<List<E>> rawQuery<E, T extends ITableProperties<Dog>>({
    List<T> select = const [],
    List<T> groupBy = const [],
    List<T> oderByByHaving = const [],
    List<T> where = const [],
    List<T> orderBy = const [],
    List<T> having = const [],
    int? limit,
    int offset = 0,
    required E Function(Map<String, Object?>) parser,
  }) async {
    final s = select.rawSelect;
    final w = where.rawWhere;
    final o = orderBy.rawOrderBy;
    final h = having.rawHaving;
    final oh = oderByByHaving.rawOrderBy;
    final l = limit.raw(offset);
    final g = groupBy.rawGroup;
    final raw = [w, g, o, h, oh, l].where((e) => e.isNotEmpty).join(' ');
    final query = 'SELECT $s FROM dogs $raw';

    log(query);

    final db = await ConfigSqflite.instance.database;
    final lst = await db.rawQuery(query);
    return lst.map((e) => parser(e)).toList();
  }

  Future<void> insert() async {
    final db = await ConfigSqflite.instance.database;
    await db.insert(
      'dogs',
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAuto() async {
    final db = await ConfigSqflite.instance.database;
    await db.rawInsert('INSERT INTO dogs(name,age,category) VALUES(?,?,?)',
        [name, age, category]);
  }

  static Future<List<Dog>> find() async {
    final db = await ConfigSqflite.instance.database;
    final lst = await db.query('dogs');
    return lst.map((e) => Dog.fromJson(e)).toList();
  }

  static Future<Dog?> findOne() async {
    final db = await ConfigSqflite.instance.database;
    final lst = await db.rawQuery('SELECT * FROM dogs LIMIT 1');
    if (lst.isEmpty) return null;
    assert(lst.length == 1, 'Raw query Exception');
    return Dog.fromJson(lst.first);
  }

  static Future<Dog?> findOneById(String id) async {
    final db = await ConfigSqflite.instance.database;
    final lst =
        await db.rawQuery('SELECT * FROM dogs WHERE id = ? LIMIT 1', [id]);
    if (lst.isEmpty) return null;
    assert(lst.length == 1, 'Raw query Exception');
    return Dog.fromJson(lst.first);
  }

  Future<void> update() async {
    final db = await ConfigSqflite.instance.database;
    await db.update('dogs', toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future<void> delete() async {
    final db = await ConfigSqflite.instance.database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}
