import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:source_gen/source_gen.dart';

const TypeChecker _typeChecker = TypeChecker.fromRuntime(ModelSql);

class ConfigChecked implements Generator {
  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final allDepsInStep = <ModelConfigGen>[];

    for (final cl in library.classes) {
      if (_typeChecker.hasAnnotationOfExact(cl)) {
        final libs = await buildStep.resolver.libraries.toList();
        allDepsInStep.add(ModelConfigGen.fromLibs(libs, cl));
      }
    }
    if (allDepsInStep.isNotEmpty) {
      return jsonEncode(allDepsInStep.map((e) => e.toMap()).toList());
    }
    return null;
  }

  ConfigChecked(Map options) {
    // if (options['class_name_pattern'] != null) {
    // _classNameMatcher = RegExp(options['class_name_pattern']);
    // }
  }
}

class ModelConfigGen {
  final String name;
  final List<String> imports;

  ModelConfigGen(
    this.name,
    this.imports,
  );

  Map<String, dynamic> toMap() => {
        'name': name,
        'imports': imports,
      };

  factory ModelConfigGen.fromJson(Map<dynamic, dynamic> json) => ModelConfigGen(
        json['name'] as String,
        (json['imports'] as List).cast<String>(),
      );

  factory ModelConfigGen.fromLibs(List<LibraryElement> libs, ClassElement cl) {
    final s =
        libs.where((e) => e.exportNamespace.definedNames.values.contains(cl));
    return ModelConfigGen(
      cl.displayName,
      s.map((e) => e.identifier).toList(),
    );
  }
}
