import 'package:db_sql_annotation/db_sql_annotation.dart';

part 'example.g.dart';

enum Sex { male, female }

@modelSql
abstract class ExampleModel {
  factory ExampleModel(
    @primaryKey int id, {
    @index required String name,
    @column required String passportId,
    @Column(10) required int? age,
    @column int? region,
    @Enumerated(Sex.male) Sex? sex,
  }) = _ExampleModel;
}
