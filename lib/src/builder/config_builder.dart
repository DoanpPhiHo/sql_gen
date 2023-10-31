import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/builder/config_checked.dart';
import 'package:db_sql_generator/src/extensions/extensions.dart';
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
    final classNames = configs.map((e) => e.name).toList();
    final configsCP = configs.map((e) => ModelConfigGen(
          imports: e.imports,
          foreign: e.foreign
              .where(
                (f) =>
                    classNames.contains(f.removeQuestion) &&
                    f.removeQuestion != e.name,
              )
              .map((e) => e.removeQuestion)
              .toList(),
          name: e.name,
          primaryId: e.primaryId,
          primaryIdType: e.primaryIdType,
        ));

    final ls = configsCP.where((e) => e.foreign.isEmpty).toList();
    final lstCP = List<ModelConfigGen>.from(configsCP.where(
      (e) => e.foreign.isNotEmpty,
    ));
    while (lstCP.isNotEmpty) {
      for (final s in List<ModelConfigGen>.from(lstCP)) {
        final v = ls.map((i) => i.name);
        final c = s.foreign.where((e) => !v.contains(e));
        if (c.isEmpty) {
          lstCP.removeWhere((e) => e.name == s.name);
          ls.add(s);
        }
      }
    }

    final funcName = element.displayName;
    final functionConfigBuilder = Method((m) {
      m
        ..name = '\$$funcName'
        ..lambda = true
        ..optionalParameters.add(Parameter((p) {
          p
            ..name = 'seeded'
            ..required = false
            ..named = true
            ..type = refer(
                'void Function(Database)?'); // void Function(Database)? seeded,
        }))
        ..body = Code('''
          ConfigSqflite.instance.configSqflite(
                '$dbName',
                raws: [
                  ${[
          '\'PRAGMA foreign_keys = ON;\'',
          for (final cg in ls) '${cg.name}Query.rawCreate'
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
