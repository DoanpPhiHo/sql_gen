part of 'extensions.dart';

final _primaryKeyChecker = const TypeChecker.fromRuntime(ID);
final _primaryKeyAutoChecker = const TypeChecker.fromRuntime(IDAuto);

final _columnChecker = const TypeChecker.fromRuntime(TColumn);
final _foreignChecker = const TypeChecker.fromRuntime(ForeignKey);
final _enumeratedChecker = const TypeChecker.fromRuntime(Enumerated);
final _indexChecker = const TypeChecker.fromRuntime(TIndex);

class ClassGBuilder {
  /// class A {} => A
  final String className;

  /// class BlueBla{} => blue_bla
  final String tableName;

  /// class BlueBla{} => BlueBlaQuery
  final String extensionName;

  /// @Table('name')
  /// class BlueBla{} => name
  final String? tableNameInput;

  /// @primaryKey
  /// final int id => GBuilder<id>
  final GBuilder? primaryKey;
  final List<GBuilder> columns;
  final List<GBuilder> foreign;
  final List<GBuilder> all;
  final List<GBuilder> allWithOutPrimary;

  String get tName => tableNameInput ?? tableName;

  ClassGBuilder({
    required this.className,
    required this.tableName,
    required this.tableNameInput,
    required this.primaryKey,
    required this.columns,
    required this.foreign,
    required this.all,
    required this.allWithOutPrimary,
    required this.extensionName,
  });

  static Future<ClassGBuilder> fromElement(ClassElement element,
      ConstantReader annotation, BuildStep buildStep) async {
    final className = element.displayName;
    final extensionName = '${element.displayName}Query';
    final tableNameInput = annotation.peek('name')?.stringValue;
    final tableName = className.underscore;

    final injectableConfigFiles = Glob("**/**.sql_model.json");
    final jsonData = <Map>[];
    await for (final id in buildStep.findAssets(injectableConfigFiles)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      jsonData.addAll([...json]);
    }
    final configs = jsonData.map((e) => ModelConfigGen.fromJson(e)).toList();

    /// fields in class Table
    final fields = element.fields.cast<FieldElement>();

    final gbs = fields.map((e) => GBuilder.from(e, configs, element)).toList();

    final primaryKey = gbs.firstWhereOrNull((e) => e.isId == true);
    final columns =
        gbs.where((e) => e.isId == false && e.subSqlType == null).toList();
    final foreign = gbs.where((e) => e.subSqlType != null).toList();
    final all = [if (primaryKey != null) primaryKey, ...columns, ...foreign];
    final allWithOutPrimary = [...columns, ...foreign];
    return ClassGBuilder(
      className: className,
      tableName: tableName,
      tableNameInput: tableNameInput,
      primaryKey: primaryKey,
      columns: columns,
      foreign: foreign,
      all: all,
      allWithOutPrimary: allWithOutPrimary,
      extensionName: extensionName,
    );
  }
}

class GBuilder {
  /// id, name
  final String fieldName;

  /// @Index(name: 'name')
  final String? fieldNameInput;

  /// final int id => 'int'
  /// final Dog dog => 'Dog'
  final String flutterType;

  /// final int id => int
  /// final Dog dog => Dog
  final DartType dartType;

  /// final int id => int
  /// final DateTime id => int
  final String sqlType;

  ///```dart
  /// class Dog{
  ///   @primaryKey
  ///   final int id;
  /// }
  /// ```
  /// final Dog dog => 'int'
  final String? subFlutterType;

  ///```dart
  /// class Dog{
  ///   @primaryKey
  ///   final int id;
  /// }
  /// ```
  /// final Dog dog => int
  final DartType? subDartType;

  ///```dart
  /// class Dog{
  ///   @primaryKey
  ///   final int id;
  /// }
  /// ```
  /// final Dog dog => 'id'
  final String? subFieldName;

  ///```dart
  /// class Dog{
  ///   @primaryKey
  ///   final int id;
  /// }
  /// ```
  /// final Dog dog => int
  /// final int id => int
  /// final DateTime id => int
  final String? subSqlType;

  ///```dart
  /// class Dog{
  ///   @primaryKey
  ///   final int id;
  /// }
  /// ```
  /// => 'Dog'
  final String nameClass;

  ///```dart
  /// class Dog{
  ///   @primaryKey
  ///   final int id;
  /// }
  /// ```
  /// => 'dogId'
  final String nameClassConst;

  /// final A a => true
  final bool isClass;

  /// final SexEnum sex => true
  final bool isEnum;

  /// final int? id => true
  final bool nullCreate;

  ///   @primaryKey
  ///   final int id; => true
  final bool isId;

  ///   @primaryKeyAuto
  ///   final int id; => true
  final bool autoId;

  ///   @TColumn(10)
  /// ```class A{
  ///   {int a = 10}
  /// }
  /// => 10
  final String? defaultValue;

  String get nameSql => fieldNameInput ?? fieldName;
  String get _typeSql => subSqlType ?? sqlType;
  String get _primary {
    final s = [''];
    if (isId) s.add('PRIMARY KEY');
    if (autoId) s.add('AUTOINCREMENT');
    return s.join(' ');
  }

  String get _notNull {
    if (nullCreate) return 'NOT NULL';
    return '';
  }

  String get rawCreate => [nameSql, _typeSql, _primary, _notNull]
      .where((e) => e.isNotEmpty)
      .join(' ');

  String get _defaultValue => defaultValue != null ? '?? $defaultValue' : '';

  String get _from {
    if (isClass) {
      return 'json[\'$fieldName\'] != null ? ${flutterType.replaceFirst('?', '')}.fromJsonDB(json[\'$fieldName\'] as Map<String,dynamic>) : null';
    }
    if (isEnum) {
      return '\$fromJson${flutterType.replaceFirst('?', '')}(json[\'$fieldName\'])';
    }
    print('json[\'$fieldName\'] as $flutterType $_defaultValue');
    return 'json[\'$fieldName\'] as $flutterType $_defaultValue';
  }

  String get _to {
    if (isClass) {
      return '${!nullCreate ? fieldName : '$fieldName?'}.$subFieldName';
    }
    if (isEnum) {
      return '\$toJson${flutterType.replaceFirst('?', '')}($fieldName)';
    }
    return fieldName;
  }

  String get rawFromJson {
    return '$fieldName: $_from';
  }

  String get rawToJson {
    if (subDartType != null) {}
    return '\'$nameSql\':$_to';
  }

  GBuilder({
    required this.fieldName,
    this.isClass = false,
    this.isEnum = false,
    this.defaultValue,
    required this.fieldNameInput,
    required this.flutterType,
    required this.dartType,
    required this.nameClass,
    required this.nameClassConst,
    required this.nullCreate,
    this.subFlutterType,
    this.subDartType,
    this.isId = false,
    this.autoId = true,
    required this.sqlType,
    this.subSqlType,
    this.subFieldName,
  });

  factory GBuilder.from(FieldElement field, List<ModelConfigGen> configs,
      ClassElement classElement) {
    String? fieldNameInput;
    bool isId = false;
    bool autoId = false;
    bool isClass = false;
    bool isEnum = false;
    final className = classElement.displayName;
    if (_foreignChecker.hasAnnotationOfExact(field)) {
      isClass = true;
      fieldNameInput = _foreignChecker
          .firstAnnotationOfExact(field)
          ?.getField('(super)')
          ?.getField('name')
          ?.toStringValue();
    }
    if (_indexChecker.hasAnnotationOfExact(field)) {
      _indexChecker
          .firstAnnotationOfExact(field)
          ?.getField('(super)')
          ?.getField('name');
    }
    if (_enumeratedChecker.hasAnnotationOfExact(field)) {
      isEnum = true;
      fieldNameInput = _enumeratedChecker
          .firstAnnotationOfExact(field)
          ?.getField('(super)')
          ?.getField('name')
          ?.toStringValue();
    }
    if (_columnChecker.hasAnnotationOfExact(field)) {
      _columnChecker
          .firstAnnotationOfExact(field)
          ?.getField('(super)')
          ?.getField('name');
    }
    if (_primaryKeyChecker.hasAnnotationOfExact(field)) {
      isId = true;
      fieldNameInput = _primaryKeyChecker
          .firstAnnotationOfExact(field)
          ?.getField('(super)')
          ?.getField('name')
          ?.toStringValue();
    }
    if (_primaryKeyAutoChecker.hasAnnotationOfExact(field)) {
      isId = true;
      autoId = true;
      fieldNameInput = _primaryKeyAutoChecker
          .firstAnnotationOfExact(field)
          ?.getField('(super)')
          ?.getField('name')
          ?.toStringValue();
    }

    final classPrivateName = '_$className${field.displayName.capitalize}';
    final classNameConst =
        (className + field.displayName.capitalize).unCapitalize;

    ModelConfigGen? config = configs.firstWhereOrNull(
      (e) => e.name == field.type.toString().replaceFirst('?', ''),
    );

    return GBuilder(
      fieldName: field.displayName,
      fieldNameInput: fieldNameInput,
      flutterType: field.type.toString(),
      dartType: field.type,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      nullCreate: field.type.nullabilitySuffix == NullabilitySuffix.question,
      sqlType: field.type.typeSql.str,
      autoId: autoId,
      subFieldName: config?.primaryId,
      defaultValue: getDefaultValue(classElement)[field.displayName],
      isClass: isClass,
      isEnum: isEnum,
      isId: isId,
      //TODO
      subDartType: null,
      subFlutterType: config?.primaryIdType,
      subSqlType: config?.primaryIdType,
    );
  }
}

Map<String, dynamic> getDefaultValue(Element element) {
  try {
    if (element is! ClassElement) throw Exception('not class');
    final eClass = element;
    final fields = eClass.constructors.first.children.cast<ParameterElement>();
    return {
      for (final field in fields) field.displayName: field.defaultValueCode
    };
  } catch (e) {
    return {};
  }
}

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

class ForeignBuilder extends CBuilder {
  ForeignBuilder({
    required super.name,
    required super.typeDart,
    required super.typeRunner,
    required super.typeSql,
    required super.nameClass,
    required super.nameClassConst,
    required super.nullSql,
    required super.param,
    super.fromJson,
    super.toJson,
    this.onDelete,
    this.onUpdate,
    super.nameParam,
  });
  final ForeignAction? onDelete;
  final ForeignAction? onUpdate;
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

  bool get _isForeign {
    if (_foreignChecker.hasAnnotationOfExact(this)) {
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

  ForeignBuilder _foreignBuilder(
    String className,
    List<ModelConfigGen> configs,
  ) {
    final fore = _foreignChecker.firstAnnotationOfExact(this)!;
    String? onUpdateStr = fore.valueFromAnnotation(type, this, 'onUpdate');
    final onUpdate =
        onUpdateStr != null ? ForeignAction.values.byName(onUpdateStr) : null;
    String? onDeleteStr = fore.valueFromAnnotation(type, this, 'onDelete');
    final onDelete =
        onDeleteStr != null ? ForeignAction.values.byName(onDeleteStr) : null;
    String? name = fore.valueFromAnnotation(type, this, 'name');

    final eName = className;
    final classPrivateName = '_$eName${displayName.capitalize}';
    final classNameConst = (className + displayName.capitalize).unCapitalize;

    final s = configs.firstWhereOrNull((e) => e.name == type.toString());

    return ForeignBuilder(
      name: name ?? displayName,
      typeDart: s?.primaryIdType ?? type.toString(),
      typeRunner: type,
      typeSql: type.typeSql.str,
      nullSql: nullCreate,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      onDelete: onDelete,
      onUpdate: onUpdate,
      nameParam: name,
      fromJson: '${type.toString().replaceFirst('?', '')}.fromJsonDB',
      toJson: '\$toMap${type.toString().replaceFirst('?', '')}',
      param: [
        type.typeSql.str,
        nullCreate,
      ].where((e) => e.isNotEmpty).join(' '),
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
      toJson: 'toMapFromDB()',
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

  List<ForeignBuilder> foreignFields(
    String className,
    List<ModelConfigGen> configs,
  ) {
    final lst = <ForeignBuilder>[];
    for (final field in this) {
      if (field._isForeign) {
        lst.add(field._foreignBuilder(className, configs));
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
