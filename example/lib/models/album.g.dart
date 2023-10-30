// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _AlbumId extends IColumn<Album> {
  const _AlbumId(
    super.str, {
    super.tableName,
  });
}

class _AlbumTitle extends IColumn<Album> {
  const _AlbumTitle(
    super.str, {
    super.tableName,
  });
}

class _AlbumArtist extends IColumn<Album> {
  const _AlbumArtist(
    super.str, {
    super.tableName,
  });
}

extension AlbumField on Album {
  static const IColumn<Album> albumId = _AlbumId('id', tableName: 'album');

  static const IColumn<Album> albumTitle =
      _AlbumTitle('title', tableName: 'album');

  static const IColumn<Album> albumArtist =
      _AlbumArtist('artistId', tableName: 'album');
}

Album $AlbumFromJsonDB(Map<String, dynamic> json) => Album(
    id: json['id'] as int? ?? 0,
    title: json['title'] as String,
    artistId: int.fromJsonDB(json['artistId'] as Map<String, dynamic>));

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension AlbumQuery on Album {
  static String get name => 'album';
// 'FOREIGN KEY (artistId) REFERENCES hhhhh (hhhhhh)  ON NO ACTION'
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'title TEXT NOT NULL',
          'artistId TEXT NOT NULL',
        ],
      );
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Album, IColumn<Album>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(albumId, id),
      );
  Map<String, dynamic> toMapFromDB() =>
      {'id': id, 'title': title, 'artistId': artistId?.$toMapArtist};
  Future<void> update() =>
      ExtraQuery.instance.update<int, Album, IColumn<Album>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(albumId, id),
      );
  static Future<Album?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Album, IColumn<Album>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(albumId, id),
        parser: (e) => Album.fromJsonDB(e),
      );
  static Future<Album?> findOne() => ExtraQuery.instance.findOne<Album>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Album.fromJsonDB(e),
      );
  static Future<List<Album>> find() => ExtraQuery.instance.find<Album>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Album.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [AlbumField.albumTitle.str, AlbumField.albumArtist.str],
        values: [title, artistId],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Album>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Album, T, F, TF>(
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
