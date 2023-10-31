// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// FieldGenerator
// **************************************************************************

// ignore_for_file:

class _EmployeeId extends IColumn<Employee> {
  const _EmployeeId(
    super.str, {
    super.tableName,
  });
}

class _EmployeeFirstName extends IColumn<Employee> {
  const _EmployeeFirstName(
    super.str, {
    super.tableName,
  });
}

class _EmployeeLastName extends IColumn<Employee> {
  const _EmployeeLastName(
    super.str, {
    super.tableName,
  });
}

class _EmployeeTitle extends IColumn<Employee> {
  const _EmployeeTitle(
    super.str, {
    super.tableName,
  });
}

class _EmployeeReportsTo extends IColumn<Employee> {
  const _EmployeeReportsTo(
    super.str, {
    super.tableName,
  });
}

class _EmployeeBirthDate extends IColumn<Employee> {
  const _EmployeeBirthDate(
    super.str, {
    super.tableName,
  });
}

class _EmployeeHireDate extends IColumn<Employee> {
  const _EmployeeHireDate(
    super.str, {
    super.tableName,
  });
}

class _EmployeeAddress extends IColumn<Employee> {
  const _EmployeeAddress(
    super.str, {
    super.tableName,
  });
}

Employee $EmployeeFromJsonDB(Map<String, dynamic> json) => Employee(
    id: json['id'] as int? ?? 0,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    title: json['title'] as String,
    reportsTo: json['reportsTo'] as int?,
    birthDate: json['birthDate'] as DateTime,
    hireDate: json['hireDate'] as DateTime,
    address: json['address'] as String);

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file:

extension EmployeeQuery on Employee {
  static const IColumn<Employee> employeeId =
      _EmployeeId('id', tableName: 'employee');

  static const IColumn<Employee> employeeFirstName =
      _EmployeeFirstName('firstName', tableName: 'employee');

  static const IColumn<Employee> employeeLastName =
      _EmployeeLastName('lastName', tableName: 'employee');

  static const IColumn<Employee> employeeTitle =
      _EmployeeTitle('title', tableName: 'employee');

  static const IColumn<Employee> employeeReportsTo =
      _EmployeeReportsTo('reportsTo', tableName: 'employee');

  static const IColumn<Employee> employeeBirthDate =
      _EmployeeBirthDate('birthDate', tableName: 'employee');

  static const IColumn<Employee> employeeHireDate =
      _EmployeeHireDate('hireDate', tableName: 'employee');

  static const IColumn<Employee> employeeAddress =
      _EmployeeAddress('address', tableName: 'employee');

  Map<String, dynamic> toMapFromDB() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'title': title,
        'reportsTo': reportsTo,
        'birthDate': birthDate,
        'hireDate': hireDate,
        'address': address
      };
  static String get rawCreate => ExtraQuery.instance.createTable(
        name,
        fields: [
          'id INTEGER  PRIMARY KEY AUTOINCREMENT',
          'firstName TEXT',
          'lastName TEXT',
          'title TEXT',
          'reportsTo INTEGER NOT NULL',
          'birthDate INTEGER',
          'hireDate INTEGER',
          'address TEXT'
        ],
      );
  static String get name => 'employee';
  Future<void> delete() =>
      ExtraQuery.instance.delete<int, Employee, IColumn<Employee>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(employeeId, id),
      );
  Future<void> update() =>
      ExtraQuery.instance.update<int, Employee, IColumn<Employee>>(
        name,
        ConfigSqflite.instance.database,
        map: toMapFromDB(),
        IdValue(employeeId, id),
      );
  static Future<Employee?> findOneById(int id) =>
      ExtraQuery.instance.findOneById<int, Employee, IColumn<Employee>>(
        name,
        ConfigSqflite.instance.database,
        IdValue(employeeId, id),
        parser: (e) => Employee.fromJsonDB(e),
      );
  static Future<Employee?> findOne() => ExtraQuery.instance.findOne<Employee>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Employee.fromJsonDB(e),
      );
  static Future<List<Employee>> find() => ExtraQuery.instance.find<Employee>(
        name,
        ConfigSqflite.instance.database,
        parser: (e) => Employee.fromJsonDB(e),
      );
  Future<void> insert() => ExtraQuery.instance.insert(
        name,
        ConfigSqflite.instance.database,
        fields: [
          EmployeeQuery.employeeFirstName.str,
          EmployeeQuery.employeeLastName.str,
          EmployeeQuery.employeeTitle.str,
          EmployeeQuery.employeeReportsTo.str,
          EmployeeQuery.employeeBirthDate.str,
          EmployeeQuery.employeeHireDate.str,
          EmployeeQuery.employeeAddress.str
        ],
        values: [
          firstName,
          lastName,
          title,
          reportsTo,
          birthDate,
          hireDate,
          address
        ],
      );
  static Future<List<E>>
      rawQuery<E, T extends IColumn<Employee>, F, TF extends IColumn<F>>({
    List<T> select = const [],
    List<T> groupBy = const [],
    List<T> oderByByHaving = const [],
    List<T> where = const [],
    List<T> orderBy = const [],
    List<T> having = const [],
    List<TF> innerJoin = const [],
    List<TF> leftJoin = const [],
    int offset = 0,
    int? limit,
    required E Function(Map<String, Object?>) parser,
    bool logQuery = true,
  }) =>
          ExtraQuery.instance.rawQuery<E, Employee, T, F, TF>(
            name,
            ConfigSqflite.instance.database,
            parser: parser,
            groupBy: groupBy,
            having: having,
            innerJoin: innerJoin,
            leftJoin: leftJoin,
            limit: limit,
            logQuery: logQuery,
            oderByByHaving: oderByByHaving,
            offset: offset,
            orderBy: orderBy,
            select: select,
            where: where,
          );
  static String get rawDropTable => ExtraQuery.instance.dropTable(name);
}
