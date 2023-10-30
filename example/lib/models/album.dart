import 'package:db_sql_query/db_sql_query.dart';

import 'artist.dart';

part 'album.g.dart';

@ModelSql()
class Album extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String title;
  @ForeignKey(
    name: 'artistId',
    // onDelete: ForeignAction.noAction,
    onUpdate: ForeignAction.noAction,
  )
  final Artist artist;

  Album({
    this.id = 0,
    required this.title,
    required this.artist,
  });

  factory Album.fromJsonDB(Map<String, dynamic> json) => $AlbumFromJsonDB(json);
}
