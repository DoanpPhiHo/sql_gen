import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/builder/config_checked.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class ConfigGenerator extends GeneratorForAnnotation<SqlConfig> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final emitter = DartEmitter(useNullSafetySyntax: true);
    final dbName = annotation.peek('dbName')!.stringValue;
    final version = annotation.peek('version')?.intValue;
    final injectableConfigFiles = Glob("**/**.sql_model.json");
    final jsonData = <Map>[];
    await for (final id in buildStep.findAssets(injectableConfigFiles)) {
      final json = jsonDecode(await buildStep.readAsString(id));
      jsonData.addAll([...json]);
    }
    final configs = jsonData.map((e) => ModelConfigGen.fromJson(e)).toList();
    final funcName = element.displayName;
    final functionConfigBuilder = Method((m) {
      m
        ..name = '\$$funcName'
        ..lambda = true
        ..body = Code('''
          ConfigSqflite.instance.configSqflite(
                '$dbName',
                raws: [
                  ${[
          '\'PRAGMA foreign_keys = ON;\'',
          for (final cg in configs) '${cg.name}Query.rawCreate'
        ].join(',')}
                ],
                version: ${version ?? -1},
              );''')
        ..returns = refer('Future<void>');
    });

    return DartFormatter().format([
      _analyzerIgnores,
      'import \'package:db_sql_query/db_sql_query.dart\';',
      for (final config in configs)
        for (final imp in config.imports) 'import \'$imp\';',
      functionConfigBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
