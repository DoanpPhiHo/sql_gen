class ModelSql {
  const ModelSql();
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

class Column<T> extends Property {
  const Column(this.defaultValue);
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
const column = Column(null);
const index = Index();
const enumerated = Enumerated(null);
