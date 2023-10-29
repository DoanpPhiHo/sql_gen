part of 'extensions.dart';

final _primaryKeyChecker = const TypeChecker.fromRuntime(ID);
final _primaryKeyAutoChecker = const TypeChecker.fromRuntime(IDAuto);

final _columnChecker = const TypeChecker.fromRuntime(TColumn);
final _enumeratedChecker = const TypeChecker.fromRuntime(Enumerated);
final _indexChecker = const TypeChecker.fromRuntime(TIndex);

abstract class CBuilder {
  final String name;
  final String typeDart;
  final DartType typeRunner;
  final String typeSql;
  final String nullSql;
  final String param;
  final String nameClass;
  final String nameClassConst;
  final String? nameParam;
  final String? fromJson;
  final String? toJson;

  CBuilder({
    required this.name,
    required this.typeDart,
    required this.typeRunner,
    required this.typeSql,
    required this.nullSql,
    required this.param,
    required this.nameClass,
    required this.nameClassConst,
    this.nameParam,
    this.fromJson,
    this.toJson,
  });
}

class IdBuilder extends CBuilder {
  IdBuilder({
    required super.name,
    required super.typeDart,
    required super.typeRunner,
    required super.typeSql,
    required super.nullSql,
    required super.param,
    required this.autoId,
    required this.isAuto,
    required super.nameClass,
    required super.nameClassConst,
    super.nameParam,
  });
  final String autoId;
  final bool isAuto;
}

class ColumnBuilder<T> extends CBuilder {
  ColumnBuilder({
    required super.name,
    required super.typeDart,
    required super.typeRunner,
    required super.typeSql,
    required super.nameClass,
    required super.nameClassConst,
    required super.nullSql,
    required super.param,
    required this.defaultValue,
    super.nameParam,
  });
  final T? defaultValue;
}

class EnumeratedBuilder<T> extends CBuilder {
  EnumeratedBuilder({
    required super.name,
    required super.typeDart,
    required super.nameClass,
    required super.nameClassConst,
    required super.typeRunner,
    required super.typeSql,
    required super.nullSql,
    required super.param,
    required this.defaultValue,
    super.nameParam,
    super.fromJson,
    super.toJson,
  });
  final T? defaultValue;
}

class IndexBuilder extends CBuilder {
  IndexBuilder({
    required super.name,
    required super.typeDart,
    required super.nameClass,
    required super.nameClassConst,
    required super.typeRunner,
    required super.typeSql,
    required super.nullSql,
    required super.param,
    super.nameParam,
  });
}

extension FX on FieldElement {
  //#region ==================== check =========================
  String get nullCreate {
    if (type.nullabilitySuffix != NullabilitySuffix.question) {
      return 'NOT NULL';
    }
    return '';
  }

  bool get _isId {
    if (_primaryKeyChecker.hasAnnotationOfExact(this)) {
      return true;
    }
    if (_primaryKeyAutoChecker.hasAnnotationOfExact(this)) {
      return true;
    }
    return false;
  }

  bool get _isColumn {
    if (_columnChecker.hasAnnotationOfExact(this)) {
      return true;
    }
    return false;
  }

  bool get _isEnum {
    if (_enumeratedChecker.hasAnnotationOfExact(this)) {
      return true;
    }
    return false;
  }

  bool get _isIndex {
    if (_indexChecker.hasAnnotationOfExact(this)) {
      return true;
    }
    return false;
  }
  //#endregion ==================== end check =========================

  IdBuilder _idBuilder(String className) {
    String primaryBuilder = 'PRIMARY KEY';
    String? nameParam;
    bool isAuto = false;
    if (_primaryKeyAutoChecker.hasAnnotationOfExact(this)) {
      isAuto = true;
      primaryBuilder = 'PRIMARY KEY AUTOINCREMENT';
      nameParam = _primaryKeyAutoChecker
          .firstAnnotationOfExact(this)!
          .valueFromAnnotation(type, this, 'name');
    } else {
      nameParam = _primaryKeyChecker
          .firstAnnotationOfExact(this)!
          .valueFromAnnotation(type, this, 'name');
    }

    final eName = className;
    final classPrivateName = '_$eName${displayName.capitalize}';
    final classNameConst = (className + displayName.capitalize).unCapitalize;

    return IdBuilder(
      isAuto: isAuto,
      name: displayName,
      typeDart: type.toString(),
      typeRunner: type,
      typeSql: type.typeSql.str,
      nullSql: nullCreate,
      autoId: primaryBuilder,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      param: [type.typeSql.str, primaryBuilder, nullCreate]
          .where((e) => e.isNotEmpty)
          .join(' '),
      nameParam: nameParam,
    );
  }

  ColumnBuilder _columnBuilder(String className) {
    dynamic defaultValue = _columnChecker
        .firstAnnotationOfExact(this)!
        .valueFromAnnotation(type, this, 'defaultValue');
    String? nameParam = _columnChecker
        .firstAnnotationOfExact(this)!
        .valueFromAnnotation(type, this, 'name');

    final eName = className;
    final classPrivateName = '_$eName${displayName.capitalize}';
    final classNameConst = (className + displayName.capitalize).unCapitalize;

    return ColumnBuilder(
      name: displayName,
      typeDart: type.toString(),
      typeRunner: type,
      typeSql: type.typeSql.str,
      nullSql: nullCreate,
      defaultValue: defaultValue,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      param:
          [type.typeSql.str, nullCreate].where((e) => e.isNotEmpty).join(' '),
      nameParam: nameParam,
    );
  }

  EnumeratedBuilder _enumBuilder(String className) {
    dynamic defaultValue = _enumeratedChecker
        .firstAnnotationOfExact(this)!
        .valueFromAnnotation(type, this, 'defaultValue');
    String? nameParam = _enumeratedChecker
        .firstAnnotationOfExact(this)!
        .valueFromAnnotation(type, this, 'name');

    final eName = className;
    final classPrivateName = '_$eName${displayName.capitalize}';
    final classNameConst = (className + displayName.capitalize).unCapitalize;

    return EnumeratedBuilder(
      name: displayName,
      typeDart: type.toString(),
      typeRunner: type,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      typeSql: type.typeSql.str,
      nullSql: nullCreate,
      defaultValue: defaultValue,
      param:
          [type.typeSql.str, nullCreate].where((e) => e.isNotEmpty).join(' '),
      nameParam: nameParam,
      fromJson: '\$fromJson${type.toString().replaceFirst('?', '')}',
      toJson: '\$toJson${type.toString().replaceFirst('?', '')}',
    );
  }

  IndexBuilder _indexBuilder(String className) {
    String? nameParam = _indexChecker
        .firstAnnotationOfExact(this)!
        .valueFromAnnotation(type, this, 'name');

    final eName = className;
    final classPrivateName = '_$eName${displayName.capitalize}';
    final classNameConst = (className + displayName.capitalize).unCapitalize;

    return IndexBuilder(
      name: displayName,
      typeDart: type.toString(),
      typeRunner: type,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      typeSql: type.typeSql.str,
      nullSql: nullCreate,
      param:
          [type.typeSql.str, nullCreate].where((e) => e.isNotEmpty).join(' '),
      nameParam: nameParam,
    );
  }
}

extension FSX on List<FieldElement> {
  IdBuilder? primaryKeyField(String className) {
    for (final field in this) {
      if (field._isId) {
        return field._idBuilder(className);
      }
    }
    return null;
  }

  List<ColumnBuilder> columnFields(String className) {
    final lst = <ColumnBuilder>[];
    for (final field in this) {
      if (field._isColumn) {
        lst.add(field._columnBuilder(className));
      }
    }
    return lst;
  }

  List<EnumeratedBuilder> enumFields(String className) {
    final lst = <EnumeratedBuilder>[];
    for (final field in this) {
      if (field._isEnum) {
        lst.add(field._enumBuilder(className));
      }
    }
    return lst;
  }

  List<IndexBuilder> indexFields(String className) {
    final lst = <IndexBuilder>[];
    for (final field in this) {
      if (field._isIndex) {
        lst.add(field._indexBuilder(className));
      }
    }
    return lst;
  }
}
