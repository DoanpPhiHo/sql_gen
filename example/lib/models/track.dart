import 'package:db_sql_query/db_sql_query.dart';

part 'track.g.dart';

@ModelSql()
class Track extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;
  @index
  final int albumId;
  @index
  final int mediaTypeId;
  @index
  final int genresId;
  @column
  final String? composer;
  @column
  final int milliseconds;
  @column
  final int bites;
  @column
  final int unitPrice;

  Track({
    this.id = 0,
    required this.name,
    required this.albumId,
    required this.bites,
    this.composer,
    required this.genresId,
    required this.mediaTypeId,
    required this.milliseconds,
    required this.unitPrice,
  });

  factory Track.fromJsonDB(Map<String, dynamic> json) => $TrackFromJsonDB(json);
}
