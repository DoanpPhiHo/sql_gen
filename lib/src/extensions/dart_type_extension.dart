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
    switch (cl?.primaryIdType?.removeQuestion) {
      case 'int':
        return TypeSql.integer;
      case 'String':
        return TypeSql.string;
    }
    if (configs.isNotEmpty) {
      final s = configs.map((e) => e.name).join(',');
      print('Data type is not supported yet: ${toString()} from configs: $s');
    }
    return TypeSql.text;
  }
}

extension StringZ on String? {
  TypeSql? get sqlType {
    if (this == null) return TypeSql.text;
    switch (this!.removeQuestion) {
      case 'int':
        return TypeSql.integer;
      case 'double':
        return TypeSql.double;
      case 'bool':
        return TypeSql.bool;
      case 'list':
        return TypeSql.list;
      case 'Map':
        return TypeSql.map;
      case 'String':
        return TypeSql.string;
    }
    print('Data type is not supported yet: $this');
    return TypeSql.text;
  }
}
