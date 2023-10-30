import 'package:db_sql_query/db_sql_query.dart';

part 'media_type.g.dart';

@ModelSql()
class MediaType extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;

  MediaType({
    this.id = 0,
    required this.name,
  });

  factory MediaType.fromJsonDB(Map<String, dynamic> json) =>
      $MediaTypeFromJsonDB(json);
}
