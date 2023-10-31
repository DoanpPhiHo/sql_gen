// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_type.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _MediaTypeId extends IColumn<MediaType> {
  const _MediaTypeId(
    super.str, {
    super.tableName,
  });
}

class _MediaTypeName extends IColumn<MediaType> {
  const _MediaTypeName(
    super.str, {
    super.tableName,
  });
}

MediaType $MediaTypeFromJsonDB(Map<String, dynamic> json) =>
    MediaType(id: json['id'] as int? ?? 0, name: json['name'] as String);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension MediaTypeQuery on MediaType {
  static const IColumn<MediaType> mediaTypeId =
      _MediaTypeId('id', tableName: 'media_type');

  static const IColumn<MediaType> mediaTypeName =
      _MediaTypeName('name', tableName: 'media_type');

  Map<String, dynamic> toMapFromDB() => {'id': id, 'name': name};
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: ['id INTEGER  PRIMARY KEY AUTOINCREMENT', 'name TEXT'],
      );
  static String get name => 'media_type';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, MediaType, IColumn<MediaType>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(mediaTypeId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, MediaType, IColumn<MediaType>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(mediaTypeId, id),
      );
  static Future<MediaType?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, MediaType, IColumn<MediaType>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(mediaTypeId, id),
        parser: (e) => MediaType.fromJsonDB(e),
      );
  static Future<MediaType?> findOne() => ExtraQuery.instance.findOne<MediaType>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => MediaType.fromJsonDB(e),
      );
  static Future<List<MediaType>> find() => ExtraQuery.instance.find<MediaType>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => MediaType.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [MediaTypeQuery.mediaTypeName.str],
        values: [name],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<MediaType>, F, TF extends IColumn<F>>({
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
          ExtraQuery.instance.rawQuery<E, MediaType, T, F, TF>(
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
