// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension AlbumQuery on Album {
  static const IColumn<Album> albumId = _AlbumId('id', tableName: 'album');

  static const IColumn<Album> albumTitle =
      _AlbumTitle('title', tableName: 'album');

  static const IColumn<Album> albumArtist =
      _AlbumArtist('artistId', tableName: 'album');

  Map<String, dynamic> toMapFromDB() =>
      {'id': id, 'title': title, 'artistId': artist?.id};
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER  PRIMARY KEY AUTOINCREMENT',
          'title TEXT',
          'artistId INTEGER NOT NULL',
          'FOREIGN KEY (artistId) REFERENCES artist (id) ON DELETE NO ACTION ON UPDATE NO ACTION'
        ],
      );
  static String get name => 'album';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Album, IColumn<Album>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(albumId, id),
      );
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
        fields: [AlbumQuery.albumTitle.str, AlbumQuery.albumArtist.str],
        values: [title, artist?.id],
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

Album $AlbumFromJsonDB(Map<String, dynamic> json) => Album(
    id: json['id'] as int? ?? 0,
    title: json['title'] as String,
    artist: json['artist'] != null
        ? Artist.fromJsonDB(json['artist'] as Map<String, dynamic>)
        : null);
