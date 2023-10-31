part of '../db_sql_annotation.dart';

// TODO(hodoan): doing test query

class ModelSqlGenerated<T extends ModelSql> {
  const ModelSqlGenerated();
}

class SqlConfig {
  final String dbName;
  final int version;

  const SqlConfig(this.dbName, {required this.version});
}

class ModelSql {
  const ModelSql({this.name, this.seeded});
  final String? name;
  final Map<String, String>? seeded;
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

abstract class ITable {
  final String? tableName;

  const ITable({this.tableName});
}

abstract class IColumn<T> extends ITable {
  final String str;

  const IColumn(this.str, {super.tableName});

  @override
  String toString() => str;
}

enum ForeignAction { setNull, setDefault, restrict, noAction, cascade }

extension ForeignActionX on ForeignAction {
  String get str {
    switch (this) {
      case ForeignAction.setNull:
        return 'SET NULL';
      case ForeignAction.setDefault:
        return 'SET DEFAULT';
      case ForeignAction.restrict:
        return 'RESTRICT';
      case ForeignAction.noAction:
        return 'NO ACTION';
      case ForeignAction.cascade:
        return 'CASCADE';
    }
  }
}

class ForeignKey extends Property {
  const ForeignKey({
    required super.name,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
  });
  final ForeignAction onDelete;
  final ForeignAction onUpdate;
}

class IDAuto extends Property {
  const IDAuto({super.name});
}

class IDMulti extends Property {
  const IDMulti({
    required super.name,
    this.onDelete = ForeignAction.noAction,
    this.onUpdate = ForeignAction.noAction,
  });
  final ForeignAction onDelete;
  final ForeignAction onUpdate;
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
// const foreignKey = ForeignKey(name: null);
