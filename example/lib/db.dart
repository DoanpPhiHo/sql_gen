import 'package:db_sql_query/db_sql_query.dart';

import 'db.config.dart';

@SqlConfig('doggie_database.db', version: 1)
Future<void> configSql() => $configSql();
