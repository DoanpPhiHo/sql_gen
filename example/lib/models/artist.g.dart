// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _ArtistId extends IColumn<Artist> {
  const _ArtistId(
    super.str, {
    super.tableName,
  });
}

class _ArtistName extends IColumn<Artist> {
  const _ArtistName(
    super.str, {
    super.tableName,
  });
}

extension ArtistField on Artist {
  static const IColumn<Artist> artistId = _ArtistId('id', tableName: 'artist');

  static const IColumn<Artist> artistName =
      _ArtistName('name', tableName: 'artist');
}

Artist $ArtistFromJsonDB(Map<String, dynamic> json) =>
    Artist(id: json['id'] as int? ?? 0, name: json['name'] as String);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension ArtistQuery on Artist {
  static String get name => 'artist';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'name TEXT NOT NULL',
        ],
      );
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Artist, IColumn<Artist>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(artistId, id),
      );
  Map<String, dynamic> toMapFromDB() => {'id': id, 'name': name};
  Future<void> update() =>
      ExtraQuery.instance.update<int, Artist, IColumn<Artist>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(artistId, id),
      );
  static Future<Artist?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Artist, IColumn<Artist>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(artistId, id),
        parser: (e) => Artist.fromJsonDB(e),
      );
  static Future<Artist?> findOne() => ExtraQuery.instance.findOne<Artist>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Artist.fromJsonDB(e),
      );
  static Future<List<Artist>> find() => ExtraQuery.instance.find<Artist>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Artist.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [ArtistField.artistName.str],
        values: [name],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Artist>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Artist, T, F, TF>(
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
