part of 'extensions.dart';

extension StringX on String {
  /// bLue => BLue
  String get capitalize => this[0].toUpperCase() + substring(1);

  /// BLue => bLue
  String get unCapitalize => this[0].toLowerCase() + substring(1);

  /// blueBla => blue_bla
  String get underscore {
    final exp = RegExp('(?<=[a-z])[A-Z]');
    return unCapitalize
        .replaceAllMapped(exp, (m) => '_${m.group(0)}')
        .toLowerCase();
  }

  String get removeQuestion {
    return replaceFirst('?', '');
  }

  String autoQuestion(String? value) {
    if (value == null) {
      return this;
    }

    return '$removeQuestion? ?? $value';
  }
}
