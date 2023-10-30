// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _TrackId extends IColumn<Track> {
  const _TrackId(
    super.str, {
    super.tableName,
  });
}

class _TrackName extends IColumn<Track> {
  const _TrackName(
    super.str, {
    super.tableName,
  });
}

class _TrackAlbumId extends IColumn<Track> {
  const _TrackAlbumId(
    super.str, {
    super.tableName,
  });
}

class _TrackMediaTypeId extends IColumn<Track> {
  const _TrackMediaTypeId(
    super.str, {
    super.tableName,
  });
}

class _TrackGenresId extends IColumn<Track> {
  const _TrackGenresId(
    super.str, {
    super.tableName,
  });
}

class _TrackComposer extends IColumn<Track> {
  const _TrackComposer(
    super.str, {
    super.tableName,
  });
}

class _TrackMilliseconds extends IColumn<Track> {
  const _TrackMilliseconds(
    super.str, {
    super.tableName,
  });
}

class _TrackBites extends IColumn<Track> {
  const _TrackBites(
    super.str, {
    super.tableName,
  });
}

class _TrackUnitPrice extends IColumn<Track> {
  const _TrackUnitPrice(
    super.str, {
    super.tableName,
  });
}

Track $TrackFromJsonDB(Map<String, dynamic> json) => Track(
    id: json['id'] as int ?? 0,
    name: json['name'] as String,
    albumId: json['albumId'] as int,
    mediaTypeId: json['mediaTypeId'] as int,
    genresId: json['genresId'] as int,
    composer: json['composer'] as String?,
    milliseconds: json['milliseconds'] as int,
    bites: json['bites'] as int,
    unitPrice: json['unitPrice'] as int);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension TrackQuery on Track {
  static const IColumn<Track> trackId = _TrackId('id', tableName: 'track');

  static const IColumn<Track> trackName =
      _TrackName('name', tableName: 'track');

  static const IColumn<Track> trackAlbumId =
      _TrackAlbumId('albumId', tableName: 'track');

  static const IColumn<Track> trackMediaTypeId =
      _TrackMediaTypeId('mediaTypeId', tableName: 'track');

  static const IColumn<Track> trackGenresId =
      _TrackGenresId('genresId', tableName: 'track');

  static const IColumn<Track> trackComposer =
      _TrackComposer('composer', tableName: 'track');

  static const IColumn<Track> trackMilliseconds =
      _TrackMilliseconds('milliseconds', tableName: 'track');

  static const IColumn<Track> trackBites =
      _TrackBites('bites', tableName: 'track');

  static const IColumn<Track> trackUnitPrice =
      _TrackUnitPrice('unitPrice', tableName: 'track');

  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'name': name,
        'albumId': albumId,
        'mediaTypeId': mediaTypeId,
        'genresId': genresId,
        'composer': composer,
        'milliseconds': milliseconds,
        'bites': bites,
        'unitPrice': unitPrice
      };
  static String get name => 'track';
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL',
          'name TEXT NOT NULL',
          'composer TEXT',
          'milliseconds INTEGER NOT NULL',
          'bites INTEGER NOT NULL',
          'unitPrice INTEGER NOT NULL',
          'albumId INTEGER NOT NULL',
          'mediaTypeId INTEGER NOT NULL',
          'genresId INTEGER NOT NULL',
        ],
      );
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Track, IColumn<Track>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(trackId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, Track, IColumn<Track>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(trackId, id),
      );
  static Future<Track?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Track, IColumn<Track>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(trackId, id),
        parser: (e) => Track.fromJsonDB(e),
      );
  static Future<Track?> findOne() => ExtraQuery.instance.findOne<Track>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Track.fromJsonDB(e),
      );
  static Future<List<Track>> find() => ExtraQuery.instance.find<Track>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Track.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          TrackQuery.trackName.str,
          TrackQuery.trackComposer.str,
          TrackQuery.trackMilliseconds.str,
          TrackQuery.trackBites.str,
          TrackQuery.trackUnitPrice.str,
          TrackQuery.trackAlbumId.str,
          TrackQuery.trackMediaTypeId.str,
          TrackQuery.trackGenresId.str
        ],
        values: [
          name,
          composer,
          milliseconds,
          bites,
          unitPrice,
          albumId,
          mediaTypeId,
          genresId
        ],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Track>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, Track, T, F, TF>(
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
