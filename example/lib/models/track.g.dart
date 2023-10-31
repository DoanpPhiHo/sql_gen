// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension TrackQuery on Track {
  static const IColumn<Track> trackId = _TrackId('id', tableName: 'track');

  static const IColumn<Track> trackName =
      _TrackName('name', tableName: 'track');

  static const IColumn<Track> trackComposer =
      _TrackComposer('composer', tableName: 'track');

  static const IColumn<Track> trackMilliseconds =
      _TrackMilliseconds('milliseconds', tableName: 'track');

  static const IColumn<Track> trackBites =
      _TrackBites('bites', tableName: 'track');

  static const IColumn<Track> trackUnitPrice =
      _TrackUnitPrice('unitPrice', tableName: 'track');

  static const IColumn<Track> trackAlbum =
      _TrackAlbum('albumId', tableName: 'track');

  static const IColumn<Track> trackMediaType =
      _TrackMediaType('mediaTypeId', tableName: 'track');

  static const IColumn<Track> trackGenres =
      _TrackGenres('genresId', tableName: 'track');

  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'name': name,
        'composer': composer,
        'milliseconds': milliseconds,
        'bites': bites,
        'unitPrice': unitPrice,
        'albumId': album?.id,
        'mediaTypeId': mediaType?.id,
        'genresId': genres?.id
      };
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER  PRIMARY KEY AUTOINCREMENT',
          'name TEXT',
          'composer TEXT NOT NULL',
          'milliseconds INTEGER',
          'bites INTEGER',
          'unitPrice INTEGER',
          'albumId INTEGER NOT NULL',
          'mediaTypeId INTEGER NOT NULL',
          'genresId INTEGER NOT NULL',
          'FOREIGN KEY (albumId) REFERENCES album (id) ON DELETE NO ACTION ON UPDATE NO ACTION',
          'FOREIGN KEY (mediaTypeId) REFERENCES mediaType (id) ON DELETE NO ACTION ON UPDATE NO ACTION',
          'FOREIGN KEY (genresId) REFERENCES genres (id) ON DELETE NO ACTION ON UPDATE NO ACTION'
        ],
      );
  static String get name => 'track';
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
          TrackQuery.trackAlbum.str,
          TrackQuery.trackMediaType.str,
          TrackQuery.trackGenres.str
        ],
        values: [
          name,
          composer,
          milliseconds,
          bites,
          unitPrice,
          album?.id,
          mediaType?.id,
          genres?.id
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

class _TrackAlbum extends IColumn<Track> {
  const _TrackAlbum(
    super.str, {
    super.tableName,
  });
}

class _TrackMediaType extends IColumn<Track> {
  const _TrackMediaType(
    super.str, {
    super.tableName,
  });
}

class _TrackGenres extends IColumn<Track> {
  const _TrackGenres(
    super.str, {
    super.tableName,
  });
}

Track $TrackFromJsonDB(Map<String, dynamic> json) => Track(
    id: json['id'] as int? ?? 0,
    name: json['name'] as String,
    composer: json['composer'] as String?,
    milliseconds: json['milliseconds'] as int,
    bites: json['bites'] as int,
    unitPrice: json['unitPrice'] as int,
    album: json['album'] != null
        ? Album.fromJsonDB(json['album'] as Map<String, dynamic>)
        : null,
    mediaType: json['mediaType'] != null
        ? MediaType.fromJsonDB(json['mediaType'] as Map<String, dynamic>)
        : null,
    genres: json['genres'] != null
        ? Genres.fromJsonDB(json['genres'] as Map<String, dynamic>)
        : null);
