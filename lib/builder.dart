import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/model_builder.dart';

Builder modelBuilder(BuilderOptions options) =>
    SharedPartBuilder([ModelGenerator()], 'model_builder');
