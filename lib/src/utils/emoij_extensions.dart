extension EMOIJExtensions on String? {
  bool get svgImage => this == 'SVG'.toLowerCase();

  bool get simpleImage => ['PNG', 'JPG', 'JPEG', 'GIF'].contains(
        (this ?? '').toUpperCase(),
      );

  String replaceWithPattern(String from, String newPattern) =>
      (this ?? '').replaceAll(from, newPattern);

  bool get isNullOrEmpty {
    if (this == null) return true;

    if ((this ?? '').isEmpty) return true;

    return false;
  }

  bool get isNotNullOrEmpty => ! isNullOrEmpty;
}

extension MapExtensions on Map<String, dynamic> {
  bool constantsTextKey(String text) {
    for (final key in keys.toList()) {
      if (text.contains(key)) {
        return true;
      }
    }
    return false;
  }

  String? getKeyWithText(String text) {
    for (final key in keys.toList()) {
      if (text.contains(key)) {
        return key;
      }
    }
    return null;
  }
}
