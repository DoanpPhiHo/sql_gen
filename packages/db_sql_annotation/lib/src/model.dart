part of '../db_sql_annotation.dart';

class ModelSql {
  const ModelSql({this.name});
  final String? name;
}

const modelSql = ModelSql();

class Property {
  const Property();
}

class ID extends Property {
  const ID();
}

class IDAuto extends Property {
  const IDAuto();
}

class TColumn<T> extends Property {
  const TColumn(this.defaultValue);
  final T? defaultValue;
}

class Index extends Property {
  const Index();
}

class Enumerated<T> extends Property {
  const Enumerated(this.defaultValue);
  final T? defaultValue;
}

const primaryKey = ID();
const primaryKeyAuto = IDAuto();
const column = TColumn(null);
const index = Index();
const enumerated = Enumerated(null);
