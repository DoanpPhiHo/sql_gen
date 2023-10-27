part of 'extensions.dart';

extension CBuilderX on CBuilder {
  String get fromJsonStr {
    if (fromJson != null) {
      return '$fromJson(json[\'$name\'] as String?)';
    }
    return 'json[\'$name\'] as $typeDart';
  }

  dynamic valueStr(Map<String, dynamic> valueFromConstructor) {
    try {
      var value = valueFromConstructor[name];
      if (this is EnumeratedBuilder && value == null) {
        value = (this as EnumeratedBuilder).defaultValue;
      }
      if (this is ColumnBuilder && value == null) {
        value = (this as ColumnBuilder).defaultValue;
      }
      if (value != null) {
        return '?? $value';
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }
}
