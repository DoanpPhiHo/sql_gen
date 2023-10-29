part of 'extensions.dart';

extension StringX on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
  String get unCapitalize => this[0].toLowerCase() + substring(1);
  String get underscore {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    return unCapitalize
        .replaceAllMapped(exp, (m) => '_${m.group(0)}')
        .toLowerCase();
  }
}
