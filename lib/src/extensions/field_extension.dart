part of 'extensions.dart';

final _primaryKeyChecker = const TypeChecker.fromRuntime(ID);
final _primaryKeyMultiChecker = const TypeChecker.fromRuntime(IDMulti);
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

  /// @primaryKeyMulti
  /// final int id => GBuilder<id>
  final List<GBuilder>? primaryKeys;

  /// @column
  /// final int id => [GBuilder<id>]
  final List<GBuilder> columns;

  /// @ForeignKey(...)
  /// final int id => [GBuilder<id>]
  final List<GBuilder> foreign;

  /// ...[foreign], ...[columns], ...[primaryKeys], [primaryKey]
  final List<GBuilder> all;

  /// ...[foreign], ...[columns]
  final List<GBuilder> allWithOutPrimary;

  /// ```dart
  /// @ModelSql(name: 'a')
  /// class Album extends ITable {}
  /// ```
  /// => a
  /// ```dart
  /// @ModelSql()
  /// class Album extends ITable {}
  /// ```
  /// => album
  String get tName => tableNameInput ?? tableName;

  String? get rawPrimaryKey {
    if (primaryKeys == null || primaryKeys!.isEmpty) return null;
    final s = primaryKeys?.map((e) => e.fieldNameInput).join(', ');
    return 'PRIMARY KEY ($s)';
  }

  ClassGBuilder({
    required this.className,
    required this.tableName,
    required this.tableNameInput,
    required this.primaryKey,
    required this.primaryKeys,
    required this.columns,
    required this.foreign,
    required this.all,
    required this.allWithOutPrimary,
    required this.extensionName,
  });

  static Future<ClassGBuilder> fromElement(ClassElement element,
      ConstantReader? annotation, BuildStep? buildStep) async {
    final className = element.displayName;
    final extensionName = '${element.displayName}Query';
    final tableNameInput = annotation?.peek('name')?.stringValue;
    final tableName = className.underscore;

    final injectableConfigFiles = Glob("**/**.sql_model.json");
    final jsonData = <Map>[];
    if (buildStep != null) {
      await for (final id in buildStep.findAssets(injectableConfigFiles)) {
        final json = jsonDecode(await buildStep.readAsString(id));
        jsonData.addAll([...json]);
      }
    }
    final configs = jsonData.map((e) => ModelConfigGen.fromJson(e)).toList();

    /**
     * static Future<void> seeded(Database db) => ExtraQuery.instance.seeded<Album>(
        name,
        db,
        parser: (e) => Album.fromJsonDB(e),
        insert: (v) => v.insert(),
        jsonStr: jsonAlbums,
      );
     */

    /// fields in class Table
    final fields = element.fields.cast<FieldElement>();

    final gbs = fields.map((e) => GBuilder.from(e, configs, element)).toList();

    final primaryKey = gbs.firstWhereOrNull((e) => e.isId == true);
    final primaryKeys = gbs.where((e) => e.isIds == true).toList();
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
      primaryKeys: primaryKeys,
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

  /// using foreign key
  /// ```dart
  /// @ForeignKey(
  ///  name: 'artistId',
  ///  onDelete: ForeignAction.noAction,
  ///  onUpdate: ForeignAction.noAction,
  /// )
  /// final Artist? artist;
  /// ```
  final ForeignAction? onDelete;

  /// using foreign key
  /// ```dart
  /// @ForeignKey(
  ///  name: 'artistId',
  ///  onDelete: ForeignAction.noAction,
  ///  onUpdate: ForeignAction.noAction,
  /// )
  /// final Artist? artist;
  /// ```
  final ForeignAction? onUpdate;

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

  ///   @primaryKeyMulti
  ///   final int a; => true
  ///   @primaryKeyMulti
  ///   final int b; => true
  final bool isIds;

  ///   @primaryKeyAuto
  ///   final int id; => true
  final bool autoId;

  ///   @TColumn(10)
  /// ```class A{
  ///   const A({int a = 10})
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
    if (!nullCreate) return 'NOT NULL';
    return '';
  }

  String get rawCreate => [nameSql, _typeSql, _primary, _notNull]
      .where((e) => e.isNotEmpty)
      .join(' ');

  String get _from {
    if (isClass) {
      if (nullCreate) {
        return 'json[\'$fieldName\'] != null ? ${flutterType.removeQuestion}.fromJsonDB(json[\'$fieldName\'] as Map<String,dynamic>) : null';
      } else {
        return '${flutterType.removeQuestion}.fromJsonDB(json[\'$fieldName\'] as Map<String,dynamic>)';
      }
    }
    if (isEnum) {
      return '\$fromJson${flutterType.removeQuestion}(json[\'$fieldName\'])';
    }
    return 'json[\'$fieldName\'] as ${flutterType.autoQuestion(defaultValue)}';
  }

  /// id => id
  /// ```dart
  /// class A{
  /// final id
  /// }
  /// ```
  ///  => a?.id
  /// ```dart
  /// enum A{a,b}
  /// ```
  /// => $toJsonA(a)
  String get to {
    if (isClass) {
      return '${!nullCreate ? fieldName : '$fieldName?'}.$subFieldName';
    }
    if (isEnum) {
      return '\$toJson${flutterType.removeQuestion}($fieldName)';
    }
    return fieldName;
  }

  /// * json['id'] as int ?? 0
  /// * artist: json['artist'] != null? Artist.fromJsonDB(json['artist'] as Map<String, dynamic>): null)
  String get rawFromJson {
    return '$fieldName: $_from';
  }

  /// * 'title': title
  /// * 'artistId': artist?.id
  String get rawToJson => '\'$nameSql\':$to';

  String get _rawDelete => onDelete != null ? 'ON DELETE ${onDelete!.str}' : '';
  String get _rawUpdate => onUpdate != null ? 'ON UPDATE ${onUpdate!.str}' : '';

  /// FOREIGN KEY (artistId) REFERENCES artist (id) ON DELETE NO ACTION ON UPDATE NO ACTION
  String get foreignStr {
    final action = ['($subFieldName)', _rawDelete, _rawUpdate]
        .where((e) => e.isNotEmpty)
        .join(' ');
    return 'FOREIGN KEY ($fieldNameInput) REFERENCES $fieldName $action';
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
    this.isId = false,
    required this.isIds,
    this.autoId = true,
    required this.sqlType,
    this.subSqlType,
    this.subFieldName,
    this.onDelete,
    this.onUpdate,
  });

  factory GBuilder.from(FieldElement field, List<ModelConfigGen> configs,
      ClassElement classElement) {
    final fieldNameInput = field.fieldNameInput;
    final onDelete = field.delValue;
    final onUpdate = field.updValue;
    final className = classElement.displayName;
    final isId = field._isPrimary || field._isPrimaryAuto;
    final autoId = field._isPrimaryAuto;
    final isIds = field._isPrimaryMulti;
    final isClass = field._isFore || field._isPrimaryMulti;
    bool isEnum = field._isEnum;

    final classPrivateName = '_$className${field.displayName.capitalize}';
    final classNameConst =
        (className + field.displayName.capitalize).unCapitalize;

    ModelConfigGen? config = configs.firstWhereOrNull(
      (e) => e.name == field.type.toString().removeQuestion,
    );

    return GBuilder(
      fieldName: field.displayName,
      fieldNameInput: fieldNameInput,
      flutterType: field.type.toString(),
      dartType: field.type,
      nameClass: classPrivateName,
      nameClassConst: classNameConst,
      nullCreate: field.type.nullabilitySuffix == NullabilitySuffix.question,
      sqlType: field.type.typeSql(configs).str,
      autoId: autoId,
      subFieldName: config?.primaryId,
      defaultValue: getDefaultValue(classElement)[field.displayName],
      isClass: isClass,
      isEnum: isEnum,
      isId: isId,
      isIds: isIds,
      subFlutterType: config?.primaryIdType,
      subSqlType: config?.primaryIdType.sqlType?.str,
      onDelete: onDelete,
      onUpdate: onUpdate,
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

extension FX on FieldElement {
  //#region ==================== check =========================
  bool get _isFore => _foreignChecker.hasAnnotationOfExact(this);
  bool get _isIndex => _indexChecker.hasAnnotationOfExact(this);
  bool get _isEnum => _enumeratedChecker.hasAnnotationOfExact(this);
  bool get _isColum => _columnChecker.hasAnnotationOfExact(this);
  bool get _isPrimary => _primaryKeyChecker.hasAnnotationOfExact(this);
  bool get _isPrimaryMulti =>
      _primaryKeyMultiChecker.hasAnnotationOfExact(this);
  bool get _isPrimaryAuto => _primaryKeyAutoChecker.hasAnnotationOfExact(this);
  //#endregion ==================== end check =========================
  //#region ================== get value ============================
  ForeignAction? get delValue {
    DartObject? dartObject;
    if (_isPrimaryMulti) {
      dartObject = _primaryKeyMultiChecker.firstAnnotationOfExact(this);
    }
    if (_isFore) {
      dartObject = _foreignChecker.firstAnnotationOfExact(this);
    }
    final v =
        dartObject?.getField('onDelete')?.getField('_name')?.toStringValue();
    if (v != null) {
      return ForeignAction.values.byName(v);
    }
    return null;
  }

  ForeignAction? get updValue {
    DartObject? dartObject;
    if (_isPrimaryMulti) {
      dartObject = _primaryKeyMultiChecker.firstAnnotationOfExact(this);
    }
    if (_isFore) {
      dartObject = _foreignChecker.firstAnnotationOfExact(this);
    }
    final v =
        dartObject?.getField('onUpdate')?.getField('_name')?.toStringValue();
    if (v != null) {
      return ForeignAction.values.byName(v);
    }
    return null;
  }

  String? get fieldNameInput {
    DartObject? dartObject;
    if (_isPrimaryAuto) {
      dartObject = _primaryKeyAutoChecker.firstAnnotationOfExact(this);
    }
    if (_isPrimaryMulti) {
      dartObject = _primaryKeyMultiChecker.firstAnnotationOfExact(this);
    }
    if (_isPrimary) {
      dartObject = _primaryKeyChecker.firstAnnotationOfExact(this);
    }
    if (_isColum) {
      dartObject = _columnChecker.firstAnnotationOfExact(this);
    }
    if (_isEnum) {
      dartObject = _enumeratedChecker.firstAnnotationOfExact(this);
    }
    if (_isIndex) {
      dartObject = _indexChecker.firstAnnotationOfExact(this);
    }
    if (_isFore) {
      dartObject = _foreignChecker.firstAnnotationOfExact(this);
    }
    return dartObject?.getField('(super)')?.getField('name')?.toStringValue();
  }
  //#endregion ================== get value ============================
}

extension FSX on List<FieldElement> {}
