library db_sql_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../src/extension_generator.dart';
import '../src/sql_model_generator.dart';

export 'package:db_sql_annotation/db_sql_annotation.dart';

Builder generateSqlBase(BuilderOptions options) =>
    SharedPartBuilder([SqlBaseGenerator()], 'db_sql_base_generator');
Builder generateSqlExtension(BuilderOptions options) =>
    SharedPartBuilder([SqlExtensionGenerator()], 'db_sql_extension_generator');
