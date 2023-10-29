import 'package:db_sql_query/db_sql_query.dart';

part 'config.g.dart';

void aaa() {}

@SqlConfig('doggie_database.db')
void configSql() => $configSql(null);
