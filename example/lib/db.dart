import 'package:db_sql_query/db_sql_query.dart';

import 'db.config.dart';

@SqlConfig('doggie_database.db', version: 2)
Future<void> configSql({void Function(Database)? seeded}) => $configSql(
      seeded: seeded,
    );
