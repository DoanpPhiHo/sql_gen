import 'package:build/build.dart';
import 'package:db_sql_generator/src/builder/config_checked.dart';
import 'package:source_gen/source_gen.dart';

import 'src/builder/config_builder.dart';
import 'src/builder/enum_builder.dart';
import 'src/builder/field_builder.dart';
import 'src/builder/model_builder.dart';

Builder modelBuilder(BuilderOptions options) =>
    SharedPartBuilder([ModelGenerator()], 'model_builder');
Builder fieldBuilder(BuilderOptions options) =>
    SharedPartBuilder([FieldGenerator()], 'field_builder');
Builder enumBuilder(BuilderOptions options) =>
    SharedPartBuilder([EnumGenerator()], 'enum_builder');
Builder configBuilder(BuilderOptions options) => LibraryBuilder(
      ConfigGenerator(),
      generatedExtension: '.config.dart',
    );

Builder checkedBuilder(BuilderOptions options) {
  return LibraryBuilder(
    ConfigChecked(options.config),
    formatOutput: (generated) => generated.replaceAll(RegExp(r'//.*|\s'), ''),
    generatedExtension: '.sql_model.json',
  );
}
