import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/builder/config_builder.dart';
import 'src/builder/enum_builder.dart';
import 'src/builder/model_builder.dart';

Builder modelBuilder(BuilderOptions options) =>
    SharedPartBuilder([ModelGenerator()], 'model_builder');
Builder enumBuilder(BuilderOptions options) =>
    SharedPartBuilder([EnumGenerator()], 'enum_builder');
Builder configBuilder(BuilderOptions options) =>
    SharedPartBuilder([ConfigGenerator()], 'config_builder');
