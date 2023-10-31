import 'package:db_sql_query/db_sql_query.dart';
import 'package:example/models/album.dart';
import 'package:example/models/genres.dart';
import 'package:example/models/media_type.dart';

part 'track.g.dart';

@ModelSql()
class Track extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;
  @ForeignKey(name: 'albumId')
  final Album? album;
  @ForeignKey(name: 'mediaTypeId')
  final MediaType? mediaType;
  @ForeignKey(name: 'genresId')
  final Genres? genres;
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
    this.album,
    required this.bites,
    this.composer,
    this.genres,
    this.mediaType,
    required this.milliseconds,
    required this.unitPrice,
  });

  factory Track.fromJsonDB(Map<String, dynamic> json) => $TrackFromJsonDB(json);
}
