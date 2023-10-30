// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_track.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _PlaylistTrackPlaylistId extends IColumn<PlaylistTrack> {
  const _PlaylistTrackPlaylistId(
    super.str, {
    super.tableName,
  });
}

class _PlaylistTrackTrackId extends IColumn<PlaylistTrack> {
  const _PlaylistTrackTrackId(
    super.str, {
    super.tableName,
  });
}

PlaylistTrack $PlaylistTrackFromJsonDB(Map<String, dynamic> json) =>
    PlaylistTrack(
        playlistId: json['playlistId'] as int ?? 0,
        trackId: json['trackId'] as int);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension PlaylistTrackQuery on PlaylistTrack {
  static const IColumn<PlaylistTrack> playlistTrackPlaylistId =
      _PlaylistTrackPlaylistId('playlistId', tableName: 'playlist_track');

  static const IColumn<PlaylistTrack> playlistTrackTrackId =
      _PlaylistTrackTrackId('trackId', tableName: 'playlist_track');

  Map<String, dynamic> toMapFromDB() =>
      {'playlistId': playlistId, 'trackId': trackId};
  static String get name => 'playlist_track';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'playlistId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'trackId INTEGER NOT NULL',
        ],
      );
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, PlaylistTrack, IColumn<PlaylistTrack>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(playlistTrackPlaylistId, playlistId),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, PlaylistTrack, IColumn<PlaylistTrack>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(playlistTrackPlaylistId, playlistId),
      );
  static Future<PlaylistTrack?> findOneById(int id) => ExtraQuery.instance
          .findOneById<int, PlaylistTrack, IColumn<PlaylistTrack>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(playlistTrackPlaylistId, id),
        parser: (e) => PlaylistTrack.fromJsonDB(e),
      );
  static Future<PlaylistTrack?> findOne() =>
      ExtraQuery.instance.findOne<PlaylistTrack>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => PlaylistTrack.fromJsonDB(e),
      );
  static Future<List<PlaylistTrack>> find() =>
      ExtraQuery.instance.find<PlaylistTrack>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => PlaylistTrack.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [PlaylistTrackQuery.playlistTrackTrackId.str],
        values: [trackId],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<PlaylistTrack>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, PlaylistTrack, T, F, TF>(
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
