import 'package:db_sql_query/db_sql_query.dart';

part 'user.g.dart';

@enumeratedSql
enum UserRole { client, admin, none }
