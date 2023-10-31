import 'package:db_sql_query/db_sql_query.dart';
import 'package:example/models/playlist.dart';
import 'package:example/models/track.dart';

part 'playlist_track.g.dart';

@ModelSql()
class PlaylistTrack extends ITable {
  @IDMulti(name: 'playlistId')
  final Playlist playlist;
  @IDMulti(name: 'trackId')
  final Track track;

  @index
  final String? content;

  PlaylistTrack({
    required this.playlist,
    required this.track,
    this.content,
  });

  factory PlaylistTrack.fromJsonDB(Map<String, dynamic> json) =>
      $PlaylistTrackFromJsonDB(json);
}
