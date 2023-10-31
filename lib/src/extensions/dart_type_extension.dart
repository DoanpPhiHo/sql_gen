part of 'extensions.dart';

extension DartTypeX on DartType {
  TypeSql typeSql(List<ModelConfigGen> configs) {
    if (isDartCoreInt) return TypeSql.integer;
    if (isDartCoreBool) return TypeSql.bool;
    if (isDartCoreDouble) return TypeSql.double;
    if (isDartCoreList) return TypeSql.list;
    if (isDartCoreMap) return TypeSql.map;
    if (isDartCoreString) return TypeSql.string;
    if (isDartCoreType) return TypeSql.type;
    if (toString() == 'DateTime') return TypeSql.integer;
    if (isDartCoreEnum || element is EnumElement) {
      return TypeSql.enumerated;
    }
    //======== check class ============
    final cl = configs.firstWhereOrNull(
      (e) => e.name == toString().removeQuestion,
    );
    switch (cl?.primaryIdType) {
      case 'int':
        return TypeSql.integer;
      case 'String':
        return TypeSql.string;
    }
    print('Data type is not supported yet: ${toString()}');
    return TypeSql.text;
  }
}
