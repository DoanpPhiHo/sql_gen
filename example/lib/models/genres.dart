import 'package:db_sql_query/db_sql_query.dart';

part 'genres.g.dart';

@ModelSql()
class Genres extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;

  Genres({
    this.id = 0,
    required this.name,
  });

  factory Genres.fromJsonDB(Map<String, dynamic> json) =>
      $GenresFromJsonDB(json);
}
