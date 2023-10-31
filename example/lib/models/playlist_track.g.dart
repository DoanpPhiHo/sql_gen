// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_track.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension PlaylistTrackQuery on PlaylistTrack {
  static const IColumn<PlaylistTrack> playlistTrackContent =
      _PlaylistTrackContent('content', tableName: 'playlist_track');

  static const IColumn<PlaylistTrack> playlistTrackPlaylist =
      _PlaylistTrackPlaylist('playlistId', tableName: 'playlist_track');

  static const IColumn<PlaylistTrack> playlistTrackTrack =
      _PlaylistTrackTrack('trackId', tableName: 'playlist_track');

  Map<String, dynamic> toMapFromDB() =>
      {'content': content, 'playlistId': playlist.id, 'trackId': track.id};
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'content TEXT NOT NULL',
          'playlistId INTEGER',
          'trackId INTEGER',
          'FOREIGN KEY (playlistId) REFERENCES playlist (id) ON DELETE NO ACTION ON UPDATE NO ACTION',
          'FOREIGN KEY (trackId) REFERENCES track (id) ON DELETE NO ACTION ON UPDATE NO ACTION',
          'PRIMARY KEY (playlistId, trackId)'
        ],
      );
  static String get name => 'playlist_track';
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
        map: toMapFromDB(),
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

class _PlaylistTrackContent extends IColumn<PlaylistTrack> {
  const _PlaylistTrackContent(
    super.str, {
    super.tableName,
  });
}

class _PlaylistTrackPlaylist extends IColumn<PlaylistTrack> {
  const _PlaylistTrackPlaylist(
    super.str, {
    super.tableName,
  });
}

class _PlaylistTrackTrack extends IColumn<PlaylistTrack> {
  const _PlaylistTrackTrack(
    super.str, {
    super.tableName,
  });
}

PlaylistTrack $PlaylistTrackFromJsonDB(Map<String, dynamic> json) =>
    PlaylistTrack(
        content: json['content'] as String?,
        playlist: Playlist.fromJsonDB(json['playlist'] as Map<String, dynamic>),
        track: Track.fromJsonDB(json['track'] as Map<String, dynamic>));
