import 'package:flutter/material.dart';
import 'package:practica_1/screens/home_screen.dart';
import 'package:practica_1/screens/login_screen.dart';
import 'package:practica_1/settings/global_values.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.banThemeDark,
        builder: (context, value, widget) {
          return MaterialApp(
            title: 'Material App',
            debugShowCheckedModeBanner: false,
            theme: value ? ThemeData.dark() : ThemeData.light(),
            home: LoginScreen(),
            routes: {"/home": (context) => HomeScreen()},
          );
        });
  }
}
