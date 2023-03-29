import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:db_sql_annotation/db_sql_annotation.dart';
import 'package:db_sql_generator/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class SqlExtensionGenerator extends GeneratorForAnnotation<SqlExtension> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    final classBuffer = StringBuffer();
    classBuffer.writeln('extension GeneratedModel on ${visitor.className} {');
    generateGettersAndSetters(visitor, classBuffer);
    classBuffer.writeln('}');

    return classBuffer.toString();
  }

  void generateGettersAndSetters(
      ModelVisitor visitor, StringBuffer classBuffer) {
    for (final field in visitor.fields.keys) {
      final variable =
          field.startsWith('_') ? field.replaceFirst('_', '') : field;

      /// gen get
      classBuffer.writeln('${visitor.fields[field]} get $variable => $field;');

      /// gen set
      classBuffer.writeln('set $variable(${visitor.fields[field]} $variable)');
      classBuffer.writeln('=> $field = $variable;');
    }
  }
}
