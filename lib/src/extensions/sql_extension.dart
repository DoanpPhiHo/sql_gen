part of 'extensions.dart';

enum TypeSql {
  integer,
  real,
  text,
  bloc,
  dateTime,
  bool,
  double,
  list,
  map,
  string,
  type,
  enumerated,
  uint8List,
}

extension TypeSqlX on TypeSql {
  String get str {
    switch (this) {
      case TypeSql.integer:
      case TypeSql.dateTime:
      case TypeSql.bool:
        return 'INTEGER';
      case TypeSql.real:
      case TypeSql.double:
        return 'REAL';
      case TypeSql.text:
      case TypeSql.list:
      case TypeSql.map:
      case TypeSql.type:
      case TypeSql.string:
      case TypeSql.enumerated:
        return 'TEXT';
      case TypeSql.bloc:
      case TypeSql.uint8List:
        return 'Uint8List';
    }
  }
}
