import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData ligthTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        //scaffoldBackgroundColor: Colors.amber,
        );
  }

  static ThemeData darkTheme() {
    final theme = ThemeData();
    return theme.copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 145, 126, 120),
    );
  }

  static ThemeData lightTheme() {
    final theme = ThemeData.light();
    return theme.copyWith(
      scaffoldBackgroundColor: const Color.fromARGB(255, 231, 225, 231),
    );
  }
}
