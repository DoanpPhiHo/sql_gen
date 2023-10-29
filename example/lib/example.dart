import 'package:db_sql_query/db_sql_query.dart';

import 'config_sqflite.dart';

part 'example.g.dart';

@enumeratedSql
enum Sex { male, female }

@ModelSql(name: 'example')
class ExampleModel {
  @primaryKeyAuto
  final int id;
  @index
  final String name;
  @column
  final String passportId;
  @column
  final int? age;
  @TColumn(4454)
  final int? region;
  @enumerated
  final Sex? sex;

  const ExampleModel({
    required this.id,
    required this.name,
    required this.passportId,
    this.age = 10,
    required this.region,
    this.sex = Sex.male,
  });

  factory ExampleModel.fromJsonDB(Map<String, dynamic> json) =>
      $ExampleModelFromJsonDB(json);
}
