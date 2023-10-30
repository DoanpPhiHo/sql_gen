part of 'extensions.dart';

extension DartTypeX on DartType {
  TypeSql typeSql(Element element) {
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
    if (element is ClassElement) {
      //TODO(hodoan):
      return TypeSql.string;
    }
    print('Data type is not supported yet: ${toString()}');
    return TypeSql.text;
  }
}

extension DartObjectX on DartObject {
  dynamic valueFromAnnotation(DartType type, Element element, String name) {
    final field = getField(name) ?? getField('(super)')?.getField(name);
    if (field == null || field.isNull) return null;
    if (field.type!.isDartCoreNull) return null;
    if (field.type!.isDartCoreInt) return field.toIntValue();
    if (field.type!.isDartCoreBool) return field.toBoolValue();
    if (field.type!.isDartCoreDouble) return field.toDoubleValue();
    if (field.type!.isDartCoreList) return field.toListValue();
    if (field.type!.isDartCoreMap) return field.toMapValue();
    if (field.type!.isDartCoreString) return field.toStringValue();
    if (field.type!.isDartCoreType) return field.toTypeValue();
    if (field.type!.isDartCoreEnum || field.type!.element is EnumElement) {
      return field.variable?.name;
    }
    if (type.isDartCoreNull) return null;
    if (type.isDartCoreInt) return field.toIntValue();
    if (type.isDartCoreBool) return field.toBoolValue();
    if (type.isDartCoreDouble) return field.toDoubleValue();
    if (type.isDartCoreList) return field.toListValue();
    if (type.isDartCoreMap) return field.toMapValue();
    if (type.isDartCoreString) return field.toStringValue();
    if (type.isDartCoreType) return field.toTypeValue();
    if (type.isDartCoreEnum || field.type!.element is EnumElement) {
      return field.variable?.name;
    }
    print('DartObjectX type is not supported yet: $field');
    return field.toString();
  }
}
