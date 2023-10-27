import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:source_gen/source_gen.dart';

const _analyzerIgnores = '// ignore_for_file: ';

class EnumGenerator extends GeneratorForAnnotation<EnumeratedSql> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final emitter = DartEmitter(useNullSafetySyntax: true);
    final enumName = element.displayName;
    final functionFromJsonBuilder = Method((m) {
      m
        ..name = '\$fromJson$enumName'
        ..body = Code('''
            if(name==null) return null;//$enumName.values[0];
            return $enumName.values.byName(name);''')
        ..requiredParameters.add(Parameter((p) {
          p
            ..name = 'name'
            ..type = refer('String?');
        }))
        ..returns = refer('$enumName?');
    });
    final functionToJsonBuilder = Method((m) {
      m
        ..name = '\$toJson$enumName'
        ..body = Code('''return value?.name;''')
        ..requiredParameters.add(Parameter((p) {
          p
            ..name = 'value'
            ..type = refer('$enumName?');
        }))
        ..returns = refer('String?');
    });
    return DartFormatter().format([
      _analyzerIgnores,
      functionFromJsonBuilder.accept(emitter),
      functionToJsonBuilder.accept(emitter),
    ].join('\n\n'));
  }
}
