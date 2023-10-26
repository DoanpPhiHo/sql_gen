import 'package:db_sql_query/db_sql_query.dart';

part 'example.g.dart';

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
  @column
  final int? region;
  @enumerated
  final Sex? sex;

  ExampleModel({
    required this.id,
    required this.name,
    required this.passportId,
    this.age = 10,
    required this.region,
    this.sex = Sex.male,
  });
}
