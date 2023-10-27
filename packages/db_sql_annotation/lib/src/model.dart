part of '../db_sql_annotation.dart';

// TODO(hodoan): doing ConfigSqflite.instance.database, test query

class ModelSqlGenerated<T extends ModelSql> {
  const ModelSqlGenerated();
}

class SqlConfig {
  final String dbName;

  const SqlConfig(this.dbName);
}

class ModelSql {
  const ModelSql({
    this.name,
    this.classQuery,
    this.db,
  });
  final String? name;
  final String? classQuery;
  final String? db;
}

const modelSql = ModelSql();

class EnumeratedSql {
  const EnumeratedSql();
}

const enumeratedSql = EnumeratedSql();

abstract class Property {
  const Property({this.name});
  final String? name;
}

class ID extends Property {
  const ID({super.name});
}

class IDAuto extends Property {
  const IDAuto({super.name});
}

class TColumn<T> extends Property {
  const TColumn(this.defaultValue, {super.name});
  final T? defaultValue;
}

class TIndex extends Property {
  const TIndex({super.name});
}

class Enumerated<T> extends Property {
  const Enumerated(this.defaultValue, {super.name});
  final T? defaultValue;
}

const primaryKey = ID();
const primaryKeyAuto = IDAuto();
const column = TColumn(null);
const index = TIndex();
const enumerated = Enumerated(null);
