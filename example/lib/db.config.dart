// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ConfigGenerator
// **************************************************************************

// ignore_for_file:

import 'package:db_sql_query/db_sql_query.dart';

import 'package:example/dog_category.dart';

import 'package:example/example.dart';

import 'package:example/dog.dart';

Future<void> $configSql() => ConfigSqflite.instance.configSqflite(
      'doggie_database.db',
      raws: [
        DogCategoryQuery.rawCreate,
        ExampleModelQuery.rawCreate,
        DogQuery.rawCreate
      ],
      version: 1,
    );
