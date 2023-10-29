part of 'extensions.dart';

extension DartTypeX on DartType {
  TypeSql get typeSql {
    if (isDartCoreInt) return TypeSql.integer;
    if (isDartCoreBool) return TypeSql.bool;
    if (isDartCoreDouble) return TypeSql.double;
    if (isDartCoreList) return TypeSql.list;
    if (isDartCoreMap) return TypeSql.map;
    if (isDartCoreString) return TypeSql.string;
    if (isDartCoreType) return TypeSql.type;
    if (isDartCoreEnum || element is EnumElement) {
      return TypeSql.enumerated;
    }
    print('Data type is not supported yet: ${toString()}');
    return TypeSql.text;
  }
}

extension DartObjectX on DartObject {
  dynamic valueFromAnnotation(DartType type, Element element, String name) {
    final field = getField(name);
    if (field == null || field.isNull) return null;
    if (type.isDartCoreNull) return null;
    if (type.isDartCoreInt) return field.toIntValue();
    if (type.isDartCoreBool) return field.toBoolValue();
    if (type.isDartCoreDouble) return field.toDoubleValue();
    if (type.isDartCoreList) return field.toListValue();
    if (type.isDartCoreMap) return field.toMapValue();
    if (type.isDartCoreString) return field.toStringValue();
    if (type.isDartCoreType) return field.toTypeValue();
    if (type.isDartCoreEnum || element is EnumElement) {
      return field.toString();
    }
    print('DartObjectX type is not supported yet: $field');
    return field.toString();
  }
}
