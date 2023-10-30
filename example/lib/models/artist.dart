import 'package:db_sql_query/db_sql_query.dart';

part 'artist.g.dart';

@ModelSql()
class Artist extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;

  Artist({
    this.id = 0,
    required this.name,
  });

  factory Artist.fromJsonDB(Map<String, dynamic> json) =>
      $ArtistFromJsonDB(json);
}
