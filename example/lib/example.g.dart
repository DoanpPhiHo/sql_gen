// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// ModelGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_local_identifiers

class _ExampleModelId extends IColumn<ExampleModel> {
  const _ExampleModelId(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelName extends IColumn<ExampleModel> {
  const _ExampleModelName(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelPassportId extends IColumn<ExampleModel> {
  const _ExampleModelPassportId(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelAge extends IColumn<ExampleModel> {
  const _ExampleModelAge(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelRegion extends IColumn<ExampleModel> {
  const _ExampleModelRegion(
    super.str, {
    super.tableName,
  });
}

class _ExampleModelSex extends IColumn<ExampleModel> {
  const _ExampleModelSex(
    super.str, {
    super.tableName,
  });
}

extension ExampleModelQuery on ExampleModel {
  static String get name => 'example';
  static IColumn<ExampleModel> get exampleModelId =>
      const _ExampleModelId('id', tableName: 'example');
  static IColumn<ExampleModel> get exampleModelName =>
      const _ExampleModelName('name', tableName: 'example');
  static IColumn<ExampleModel> get exampleModelPassportId =>
      const _ExampleModelPassportId('passportId', tableName: 'example');
  static IColumn<ExampleModel> get exampleModelAge =>
      const _ExampleModelAge('age', tableName: 'example');
  static IColumn<ExampleModel> get exampleModelRegion =>
      const _ExampleModelRegion('region', tableName: 'example');
  static IColumn<ExampleModel> get exampleModelSex =>
      const _ExampleModelSex('sex', tableName: 'example');
  static rawCreateTable() {
    return '''CREATE TABLE ExampleModel (
      id INTEGER NOT NULL, 
			name TEXT NOT NULL, 
			passportId TEXT NOT NULL, 
			age INTEGER, 
			region INTEGER NOT NULL, 
			sex TEXT
    )''';
  }
}
