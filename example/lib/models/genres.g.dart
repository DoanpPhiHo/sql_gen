// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _GenresId extends IColumn<Genres> {
  const _GenresId(
    super.str, {
    super.tableName,
  });
}

class _GenresName extends IColumn<Genres> {
  const _GenresName(
    super.str, {
    super.tableName,
  });
}

Genres $GenresFromJsonDB(Map<String, dynamic> json) =>
    Genres(id: json['id'] as int? ?? 0, name: json['name'] as String);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension GenresQuery on Genres {
  static const IColumn<Genres> genresId = _GenresId('id', tableName: 'genres');

  static const IColumn<Genres> genresName =
      _GenresName('name', tableName: 'genres');

  Map<String, dynamic> toMapFromDB() => {'id': id, 'name': name};
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: ['id INTEGER  PRIMARY KEY AUTOINCREMENT', 'name TEXT'],
      );
  static String get name => 'genres';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Genres, IColumn<Genres>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(genresId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, Genres, IColumn<Genres>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(genresId, id),
      );
  static Future<Genres?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Genres, IColumn<Genres>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(genresId, id),
        parser: (e) => Genres.fromJsonDB(e),
      );
  static Future<Genres?> findOne() => ExtraQuery.instance.findOne<Genres>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Genres.fromJsonDB(e),
      );
  static Future<List<Genres>> find() => ExtraQuery.instance.find<Genres>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Genres.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [GenresQuery.genresName.str],
        values: [name],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Genres>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Genres, T, F, TF>(
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
