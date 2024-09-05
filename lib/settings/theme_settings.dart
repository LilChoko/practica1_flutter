import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData ligthTheme(BuildContext context) {
    final theme = ThemeData.light();
    return theme.copyWith(
        colorScheme: Theme.of(context)
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 255, 0, 0)));
  }

  static ThemeData darkTheme() {
    final theme = ThemeData();
    return theme.copyWith();
  }

  static ThemeData warmTheme() {
    final theme = ThemeData.light();
    return theme.copyWith();
  }
}
