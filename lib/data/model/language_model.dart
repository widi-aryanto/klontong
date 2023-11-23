import 'dart:ui';

enum Language {
  english(
    Locale('en', 'US'),
    'English',
  ),
  indonesia(
    Locale('id', 'ID'),
    'Bahasa Indonesia',
  );

  const Language(this.value, this.text);

  final Locale value;
  final String text;
}