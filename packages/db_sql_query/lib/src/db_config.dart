part of '../db_sql_query.dart';

class ConfigSqflite {
  ConfigSqflite._();
  static ConfigSqflite instance = ConfigSqflite._();
  late final Future<Database> database;
  Future<void> configSqflite(
    String dbName, {
    required List<String> raws,
    List<String> rawForeign = const [],
    List<String> seeded = const [],
    int version = -1,
  }) async {
    database = openDatabase(
      join(await getDatabasesPath(), '$dbName.db'),
      onCreate: (db, version) async {
        await Future.wait([
          for (final raw in raws) db.execute(raw),
        ]);
      },
      onDowngrade: (db, oldVersion, newVersion) {},
      onConfigure: (db) {},
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) {},
      version: version,
    );
  }
}
