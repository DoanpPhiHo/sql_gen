// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_local_identifiers

class _ExampleModel implements ExampleModel {
  _ExampleModel(
    this.id, {
    required this.name,
    required this.passportId,
    this.age = 10,
    this.region,
    this.sex = Sex.male,
  });

  final int id;

  final String name;

  final String passportId;

  final int? age;

  final int? region;

  final Sex? sex;
}

extension ExampleModelQuery on ExampleModel {
  static rawCreateTable() {
    return '''CREATE TABLE ExampleModel (
      id INTEGER PRIMARY KEY NOT NULL, 
			name TEXT NOT NULL, 
			passportId TEXT NOT NULL, 
			age INTEGER NOT NULL, 
			region INTEGER, 
			sex TEXT
    )''';
  }

  static rawDropTable() {
    return 'DROP TABLE IF EXISTS ExampleModel';
  }

  static rawSelectAll() {
    return 'SELECT * FROM ExampleModel';
  }

  static rawDeleteByID(int id) {
    return 'DELETE * FROM ExampleModel where id = $id';
  }
}
