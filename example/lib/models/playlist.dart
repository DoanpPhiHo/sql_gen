import 'package:db_sql_query/db_sql_query.dart';

part 'playlist.g.dart';

@ModelSql()
class Playlist extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;

  Playlist({
    this.id = 0,
    required this.name,
  });

  factory Playlist.fromJsonDB(Map<String, dynamic> json) =>
      $PlaylistFromJsonDB(json);
}
