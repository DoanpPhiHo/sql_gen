import 'dart:async';
import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/extensions/extensions.dart';
import 'package:source_gen/source_gen.dart';

const TypeChecker _typeChecker = TypeChecker.fromRuntime(ModelSql);

class ConfigChecked implements Generator {
  @override
  FutureOr<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final allDepsInStep = <ModelConfigGen>[];

    for (final cl in library.classes) {
      if (_typeChecker.hasAnnotationOfExact(cl)) {
        final libs = await buildStep.resolver.libraries.toList();
        allDepsInStep.add(await ModelConfigGen.fromLibs(libs, cl));
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
  final String? primaryId;
  final String? primaryIdType;
  final List<String> foreign;

  ModelConfigGen({
    required this.name,
    required this.imports,
    required this.primaryId,
    required this.primaryIdType,
    required this.foreign,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'imports': imports,
        'primaryId': primaryId,
        'primaryIdType': primaryIdType,
        'foreign': foreign,
      };

  factory ModelConfigGen.fromJson(Map<dynamic, dynamic> json) => ModelConfigGen(
        name: json['name'] as String,
        imports: (json['imports'] as List).cast<String>(),
        primaryId: json['primaryId'] as String?,
        primaryIdType: json['primaryIdType'] as String?,
        foreign: json['foreign'] != null
            ? (json['foreign'] as List).cast<String>()
            : [],
      );

  static Future<ModelConfigGen> fromLibs(
      List<LibraryElement> libs, ClassElement cl) async {
    final s =
        libs.where((e) => e.exportNamespace.definedNames.values.contains(cl));
    final ClassGBuilder gBuilder =
        await ClassGBuilder.fromElement(cl, null, null);
    return ModelConfigGen(
      name: cl.displayName,
      imports: s.map((e) => e.identifier).toList(),
      primaryId: gBuilder.primaryKey?.fieldName,
      primaryIdType: gBuilder.primaryKey?.dartType.toString(),
      foreign: [
        for (final s in gBuilder.all) s.flutterType,
      ],
    );
  }
}
