part of '../db_sql_query.dart';

extension OrderByX on OrderBy {
  String get str {
    switch (this) {
      case OrderBy.asc:
        return 'ASC';

      case OrderBy.desc:
        return 'DESC';
    }
  }
}

extension ListX on List<IColumn> {
  String get _s => ', ';
  String get _a => ' AND ';
  String get _grBy => 'GROUP BY ';
  String get _where => 'WHERE ';
  String get _having => 'HAVING ';
  String get _orderBy => 'ORDER BY ';
  String get _raw => map((e) => e._s).join(_s);
  String get _rawAnd => map((e) => e._s).join(_a);

  String get rawSelect {
    return isEmpty ? '*' : _raw;
  }

  String get rawGroup {
    if (isEmpty) return '';
    return _grBy + _raw;
  }

  String get rawWhere {
    if (isEmpty) return '';
    return _where + _rawAnd;
  }

  String get rawHaving {
    if (isEmpty) return '';
    return _having + _rawAnd;
  }

  String get rawOrderBy {
    if (isEmpty) return '';
    return _orderBy + _raw;
  }

  String get rawSelectInner {
    if (isEmpty) return '';
    return map((e) => e._s.split(_ss)[0]).join(_s);
  }

  String get rawQueryInner {
    if (isEmpty) return '';
    return map((e) => e._s.split(_ss)[1]).join('\n');
  }
}

extension IColumnX on IColumn {
  String get _s {
    if (str.split('.').length > 1) return str;
    final s = tableName ?? '';
    return [s, str].where((e) => e.isNotEmpty).join('.');
  }
}

extension Limit on int? {
  String raw(int offset) {
    if (this == null) return '';
    return 'LIMIT $this OFFSET $offset';
  }
}

class IdValue<T, E, F extends IColumn<E>> {
  final F name;
  final T value;

  IdValue(this.name, this.value);
}

typedef ValueParser<T> = T Function(Map<String, dynamic>);

class ExtraQuery {
  ExtraQuery._();
  static ExtraQuery instance = ExtraQuery._();

  String createTable(
    String table, {
    List<String> fields = const [],
  }) =>
      '''CREATE TABLE IF NOT EXISTS $table(
          ${fields.join(',\n')}
        )''';

  Future<void> insert(
    String table,
    Future<Database> database, {
    List<String> fields = const [],
    List<dynamic> values = const [],
    Map<String, dynamic> map = const {},
  }) async {
    assert(fields.length == values.length, 'length fields not equal values');
    final db = await database;
    if (fields.isNotEmpty) {
      final fStr = fields.join(',');
      final fParams = fields.map((e) => '?').join(',');
      await db.rawInsert('INSERT INTO $table($fStr) VALUES($fParams)', values);
      return;
    }
    await db.insert(table, map, conflictAlgorithm: ConflictAlgorithm.replace);
    return;
  }

  Future<void> delete<T, E, F extends IColumn<E>>(
    String table,
    Future<Database> database,
    IdValue<T, E, F> id,
  ) async {
    final db = await database;
    await db.delete(table, where: '${id.name._s} = ?', whereArgs: [id.value]);
  }

  Future<void> update<T, E, F extends IColumn<E>>(
    String table,
    Future<Database> database,
    IdValue<T, E, F> id, {
    Map<String, dynamic> map = const {},
  }) async {
    final db = await database;
    await db
        .update(table, map, where: '${id.name._s} = ?', whereArgs: [id.value]);
  }

  Future<E?> findOneById<T, E, F extends IColumn<E>>(
    String table,
    Future<Database> database,
    IdValue<T, E, F> id, {
    required ValueParser<E> parser,
  }) async {
    final db = await database;
    final lst = await db.rawQuery(
      'SELECT * FROM $table WHERE ${id.name._s} = ? LIMIT 1',
      [id.value],
    );
    if (lst.isEmpty) return null;
    assert(lst.length == 1, 'Raw query Exception');
    return parser(lst.first);
  }

  Future<E?> findOne<E>(
    String table,
    Future<Database> database, {
    required ValueParser<E> parser,
  }) async {
    final db = await database;
    final lst = await db.rawQuery(
      'SELECT * FROM $table LIMIT 1',
    );
    if (lst.isEmpty) return null;
    assert(lst.length == 1, 'Raw query Exception');
    return parser(lst.first);
  }

  Future<List<E>> find<E>(
    String table,
    Future<Database> database, {
    required ValueParser<E> parser,
  }) async {
    final db = await database;
    final lst = await db.query(table);
    return lst.map((e) => parser(e)).toList();
  }

  Future<List<E>>
      rawQuery<E, G, T extends IColumn<G>, F, TF extends IColumn<F>>(
    String table,
    Future<Database> database, {
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
  }) async {
    final s = select.rawSelect;
    final w = where.rawWhere;
    final o = orderBy.rawOrderBy;
    final h = having.rawHaving;
    final oh = oderByByHaving.rawOrderBy;
    final l = limit.raw(offset);
    final g = groupBy.rawGroup;
    final inn = innerJoin.rawQueryInner;
    final sin = innerJoin.rawSelectInner;
    final iln = leftJoin.rawQueryInner;
    final sln = leftJoin.rawSelectInner;
    final raw =
        [inn, iln, w, g, o, h, oh, l].where((e) => e.isNotEmpty).join(' ');
    final ss = [s, sin, sln].where((e) => e.isNotEmpty).join(', ');
    final query = 'SELECT $ss FROM $table $raw';

    if (logQuery) log(query);

    final db = await database;
    final lst = await db.rawQuery(query);
    return lst.map((e) => parser(e)).toList();
  }
}
