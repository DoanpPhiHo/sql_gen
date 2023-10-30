import 'package:db_sql_query/db_sql_query.dart';

part 'dog_category.g.dart';

@ModelSql(name: 'dog_category')
class DogCategory extends ITable {
  @primaryKeyAuto
  final int id;
  @column
  final String name;

  DogCategory({
    this.id = 0,
    required this.name,
  });

  factory DogCategory.fromJsonDB(Map<String, dynamic> json) =>
      $DogCategoryFromJsonDB(json);
}
