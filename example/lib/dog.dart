import 'package:db_sql_query/db_sql_query.dart';

part 'dog.g.dart';

@ModelSql()
class Dog extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;
  @column
  final int? age;
  @index
  final int category;

  Dog({
    this.id = 0,
    required this.name,
    this.age,
    required this.category,
  });

  factory Dog.fromJsonDB(Map<String, dynamic> json) => $DogFromJsonDB(json);
}
