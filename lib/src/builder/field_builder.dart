import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/extensions/extensions.dart';
import 'package:source_gen/source_gen.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class FieldGenerator extends GeneratorForAnnotation<ModelSql> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) return;
    final gBuilder =
        await ClassGBuilder.fromElement(element, annotation, buildStep);

    final lstClassBuilder = gBuilder.all.map((e) => Class((c) {
          c
            ..name = e.nameClass
            ..extend = Reference('IColumn<${gBuilder.className}>')
            ..constructors.add(Constructor((cb) {
              cb
                ..constant = true
                ..requiredParameters.add(
                  Parameter(
                    (p) {
                      p
                        ..name = 'str'
                        ..toSuper = true;
                    },
                  ),
                )
                ..optionalParameters.add(
                  Parameter(
                    (p) {
                      p
                        ..name = 'tableName'
                        ..required = false
                        ..named = true
                        ..toSuper = true;
                    },
                  ),
                );
            }));
        }));

    final functionFromJsonBuilder = Method((m) {
      m
        ..name = '\$${gBuilder.className}FromJsonDB'
        ..lambda = true
        ..body = Code('''
            ${gBuilder.className}(
              ${[for (final s in gBuilder.all) s.rawFromJson].join(',')}
            );''')
        ..requiredParameters.add(Parameter((p) {
          p
            ..name = 'json'
            ..type = refer('Map<String,dynamic>');
        }))
        ..returns = refer(gBuilder.className);
    });

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format([
      _analyzerIgnores,
      for (final s in lstClassBuilder) s.accept(emitter),
      functionFromJsonBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
