import 'package:db_sql_query/db_sql_query.dart';

part 'employee.g.dart';

@ModelSql()
class Employee extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String firstName;
  @column
  final String lastName;
  @column
  final String title;
  @column
  final int? reportsTo;
  @column
  final DateTime birthDate;
  @column
  final DateTime hireDate;
  @column
  final String address;

  Employee({
    this.id = 0,
    required this.firstName,
    required this.address,
    required this.birthDate,
    required this.hireDate,
    required this.lastName,
    this.reportsTo,
    required this.title,
  });

  factory Employee.fromJsonDB(Map<String, dynamic> json) =>
      $EmployeeFromJsonDB(json);
}
