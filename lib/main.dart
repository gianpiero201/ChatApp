import 'package:chatapp/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 231, 209, 232),
          secondary: Color.fromARGB(255, 209, 196, 233),
          background: Color.fromARGB(255, 241, 244, 248),
          brightness: Brightness.light,
          error: Color.fromARGB(255, 255, 89, 99),
          onBackground: Color.fromARGB(255, 241, 244, 248),
          onError: Color.fromARGB(255, 255, 89, 99),
          onPrimary: Color.fromARGB(255, 231, 209, 232),
          onSecondary: Color.fromARGB(255, 209, 196, 233),
          onSurface: Color.fromARGB(255, 189, 189, 189),
          surface: Color.fromARGB(255, 189, 189, 189),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          titleMedium: TextStyle(color: Color.fromARGB(255, 57, 57, 57)),
        ),
      ),
      darkTheme: ThemeData(),
      home: const LoginWidget(),
    );
  }
}
