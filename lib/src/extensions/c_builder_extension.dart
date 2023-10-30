part of 'extensions.dart';

extension CBuilderX on CBuilder {
  String fromJsonStr(Map<String, dynamic> valueFromConstructor) {
    final v = valueStr(valueFromConstructor);
    if (this is ForeignBuilder) {
      return '${typeDart.replaceFirst('?', '')}.fromJsonDB(json[\'$name\'] as Map<String,dynamic>) $v';
    }
    if (fromJson != null) {
      return '$fromJson(json[\'$name\'] as String?) $v';
    }
    String s = typeDart;
    if (!s.contains('?') && v.isNotEmpty) {
      s += '?';
    }
    return 'json[\'$name\'] as $s $v';
  }

  String valueStr(Map<String, dynamic> valueFromConstructor) {
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
