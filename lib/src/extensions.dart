import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:source_gen/source_gen.dart';

enum TypeSql {
  integer,
  real,
  text,
  bloc,
  dateTime,
  bool,
  double,
  list,
  map,
  string,
  type,
  enumerated,
  uint8List,
}

extension TypeSqlX on TypeSql {
  String get str {
    switch (this) {
      case TypeSql.integer:
      case TypeSql.dateTime:
      case TypeSql.bool:
        return 'INTEGER';
      case TypeSql.real:
      case TypeSql.double:
        return 'REAL';
      case TypeSql.text:
      case TypeSql.list:
      case TypeSql.map:
      case TypeSql.type:
      case TypeSql.string:
      case TypeSql.enumerated:
        return 'TEXT';
      case TypeSql.bloc:
      case TypeSql.uint8List:
        return 'Uint8List';
    }
  }
}

// TODO(hodoan): miss more TypeSql by annotation
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

extension ListX on List<ParameterElement> {
  List<String> get fieldsName {
    final lst = <String>[];
    for (final field in this) {
      final name = field.displayName;
      final type = field.type.typeSql.str;
      final nullCreate = field.nullCreate;
      final key = field.primaryStr;
      final str = '$name $type$key$nullCreate';
      lst.add(str);
    }
    return lst;
  }

  ParameterElement? get primary {
    for (final field in this) {
      if (field.primaryElement != null) {
        return field;
      }
    }
    return null;
  }
}

extension DartObjectX on DartObject? {
  String? value(DartType dartType) {
    if (this == null) return null;
    if (dartType.isDartCoreInt) return this!.toIntValue()?.toString();
    if (dartType.isDartCoreBool) return this!.toBoolValue()?.toString();
    if (dartType.isDartCoreDouble) return this!.toDoubleValue()?.toString();
    if (dartType.isDartCoreFunction) return this!.toFunctionValue()?.toString();
    if (dartType.isDartCoreList) return this!.toListValue()?.toString();
    if (dartType.isDartCoreMap) return this!.toMapValue()?.toString();
    if (dartType.isDartCoreSet) return this!.toSetValue()?.toString();
    if (dartType.isDartCoreString) return this!.toStringValue()?.toString();
    if (dartType.isDartCoreType) return this!.toTypeValue()?.toString();
    if (dartType.isDartCoreEnum || dartType.element is EnumElement) {
      final eName = (dartType.element as EnumElement).displayName;
      final value = this!.toString().split('(\'').last.split('\')').first;
      return '$eName.$value';
    }
    print('Data type is not supported yet: ${toString()}');
    return null;
  }
}

extension DynamicX on String? {
  Code? get genCode {
    if (this == null) return null;
    return Code(toString());
  }
}

final _columnChecker = const TypeChecker.fromRuntime(TColumn);
final _enumeratedChecker = const TypeChecker.fromRuntime(Enumerated);

final _primaryKeyChecker = const TypeChecker.fromRuntime(ID);
final _primaryKeyAutoChecker = const TypeChecker.fromRuntime(ID);

// TODO(hodoan): doing
final _indexChecker = const TypeChecker.fromRuntime(Enumerated);

extension ParameterElementX on ParameterElement {
  //#region column
  bool get _isColumn => _columnChecker.hasAnnotationOfExact(this);
  DartObject? get _valueColumn => _columnChecker.firstAnnotationOfExact(this);
  DartObject? get _dataColumn => _valueColumn?.getField('defaultValue');
  Code? get _codeColumn => _dataColumn.value(type).genCode;
  //#endregion
  //#region primary key
  bool get _isPrimaryKey => _primaryKeyChecker.hasAnnotationOfExact(this);
  bool get _isPrimaryKeyAuto =>
      _primaryKeyAutoChecker.hasAnnotationOfExact(this);
  //#endregion
  //#region enum
  bool get _isEnumerated => _enumeratedChecker.hasAnnotationOfExact(this);
  DartObject? get _valueEnumerated =>
      _enumeratedChecker.firstAnnotationOfExact(this);
  DartObject? get _dataEnumerated => _valueEnumerated?.getField('defaultValue');
  Code? get _codeEnumerated => _dataEnumerated.value(type).genCode;
  //#endregion
  //#region publish
  String get primaryStr {
    if (_isPrimaryKey) {
      return ' PRIMARY KEY';
    }
    if (_isPrimaryKeyAuto) {
      return ' PRIMARY KEY AUTOINCREMENT';
    }
    return '';
  }

  ParameterElement? get primaryElement {
    if (_isPrimaryKey) {
      return this;
    }
    if (_isPrimaryKeyAuto) {
      return this;
    }
    return null;
  }

  String get nullCreate {
    if (isRequired) {
      return ' NOT NULL';
    }
    return '';
  }

  bool get isRequiredByParam {
    if (_isColumn && _codeColumn != null) {
      return false;
    }
    if (_isEnumerated && _codeEnumerated != null) {
      return false;
    }
    return isRequired;
  }

  Code? get value {
    if (_isEnumerated) {}
    if (_isColumn) return _codeColumn;
    if (_isEnumerated) return _codeEnumerated;
    return null;
  }
  //#endregion
}
