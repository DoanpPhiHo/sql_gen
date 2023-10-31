// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension PlaylistQuery on Playlist {
  static const IColumn<Playlist> playlistId =
      _PlaylistId('id', tableName: 'playlist');

  static const IColumn<Playlist> playlistName =
      _PlaylistName('name', tableName: 'playlist');

  Map<String, dynamic> toMapFromDB() => {'id': id, 'name': name};
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: ['id INTEGER  PRIMARY KEY AUTOINCREMENT', 'name TEXT'],
      );
  static String get name => 'playlist';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Playlist, IColumn<Playlist>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(playlistId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, Playlist, IColumn<Playlist>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(playlistId, id),
      );
  static Future<Playlist?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Playlist, IColumn<Playlist>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(playlistId, id),
        parser: (e) => Playlist.fromJsonDB(e),
      );
  static Future<Playlist?> findOne() => ExtraQuery.instance.findOne<Playlist>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Playlist.fromJsonDB(e),
      );
  static Future<List<Playlist>> find() => ExtraQuery.instance.find<Playlist>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Playlist.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [PlaylistQuery.playlistName.str],
        values: [name],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Playlist>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Playlist, T, F, TF>(
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

class _PlaylistId extends IColumn<Playlist> {
  const _PlaylistId(
    super.str, {
    super.tableName,
  });
}

class _PlaylistName extends IColumn<Playlist> {
  const _PlaylistName(
    super.str, {
    super.tableName,
  });
}

Playlist $PlaylistFromJsonDB(Map<String, dynamic> json) =>
    Playlist(id: json['id'] as int? ?? 0, name: json['name'] as String);
