import 'package:db_sql_query/db_sql_query.dart';

part 'playlist_track.g.dart';

@ModelSql()
class PlaylistTrack extends ITable {
  @primaryKeyAuto
  final int playlistId;
  // TODO(hodoan): multy key to primary
  @index
  final int trackId;

  PlaylistTrack({
    this.playlistId = 0,
    required this.trackId,
  });

  factory PlaylistTrack.fromJsonDB(Map<String, dynamic> json) =>
      $PlaylistTrackFromJsonDB(json);
}
