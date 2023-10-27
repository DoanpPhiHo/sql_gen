import 'package:example/dog.dart';
import 'package:example/dog_category.dart';
import 'package:path/path.dart';
import 'package:db_sql_query/db_sql_query.dart';

class ConfigSqflite {
  ConfigSqflite._();
  static ConfigSqflite instance = ConfigSqflite._();
  late final Future<Database> database;
  Future<void> configSqflite() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) async {
        await Future.wait([
          db.execute(DogCategoryQuery.rawCreate),
          db.execute(DogQuery.rawCreate),
        ]);
      },
      onDowngrade: (db, oldVersion, newVersion) {},
      onConfigure: (db) {},
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) {},
      version: 2,
    );
  }
}
