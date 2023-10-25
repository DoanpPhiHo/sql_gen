import 'dart:developer';

import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:example/config_sqflite.dart';
import 'package:sqflite/sql.dart';

class DogCategory {
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

class _DogCategoryId extends ITableProperties<DogCategory> {
  const _DogCategoryId() : super('id');
}

class _DogCategoryName extends ITableProperties<DogCategory> {
  const _DogCategoryName() : super('name');
}

const dogCategoryId = _DogCategoryId();
const dogCategoryName = _DogCategoryName();

extension DogCategoryQuery on DogCategory {
  static String get rawCreate => '''CREATE TABLE IF NOT EXISTS dog_categories(
          id INTEGER PRIMARY KEY autoincrement,
          name TEXT NOT NULL
        )''';

  // TODO(hodoan): FUTURE ```JOIN table ON```
  static Future<List<E>> rawQuery<E, T extends ITableProperties<DogCategory>>({
    List<T> select = const [],
    List<T> groupBy = const [],
    List<T> where = const [],
    List<T> orderBy = const [],
    int? limit,
    int offset = 0,
    required E Function(Map<String, Object?>) parser,
  }) async {
    final s = select.isEmpty ? '*' : select.map((e) => e.str).join(', ');
    final w =
        where.isEmpty ? '' : 'WHERE ${where.map((e) => e.str).join(', ')}';
    final o = orderBy.isEmpty
        ? ''
        : 'ORDER BY ${orderBy.map((e) => e.str).join(', ')}';
    final l = limit.raw(offset);
    final g = groupBy.rawGroup;
    final raw = [w, g, o, l].where((e) => e.isNotEmpty).join(' ');
    final query = 'SELECT $s FROM dog_categories $raw';

    log(query);

    final db = await ConfigSqflite.instance.database;
    final lst = await db.rawQuery(query);
    return lst.map((e) => parser(e)).toList();
  }

  Future<void> insert() async {
    final db = await ConfigSqflite.instance.database;
    await db.insert(
      'dog_categories',
      toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAuto() async {
    final db = await ConfigSqflite.instance.database;
    await db.rawInsert('INSERT INTO dog_categories(name) VALUES(?)', [name]);
  }

  static Future<List<DogCategory>> find() async {
    final db = await ConfigSqflite.instance.database;
    final lst = await db.query('dog_categories');
    return lst.map((e) => DogCategory.fromJson(e)).toList();
  }

  static Future<DogCategory?> findOne() async {
    final db = await ConfigSqflite.instance.database;
    final lst = await db.rawQuery('SELECT * FROM dog_categories LIMIT 1');
    if (lst.isEmpty) return null;
    assert(lst.length == 1, 'Raw query Exception');
    return DogCategory.fromJson(lst.first);
  }

  static Future<DogCategory?> findOneById(String id) async {
    final db = await ConfigSqflite.instance.database;
    final lst = await db
        .rawQuery('SELECT * FROM dog_categories WHERE id = ? LIMIT 1', [id]);
    if (lst.isEmpty) return null;
    assert(lst.length == 1, 'Raw query Exception');
    return DogCategory.fromJson(lst.first);
  }

  Future<void> update() async {
    final db = await ConfigSqflite.instance.database;
    await db
        .update('dog_categories', toMap(), where: 'id = ?', whereArgs: [id]);
  }

  Future<void> delete() async {
    final db = await ConfigSqflite.instance.database;
    await db.delete('dog_categories', where: 'id = ?', whereArgs: [id]);
  }
}
