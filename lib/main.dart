import 'package:flutter/material.dart';
import 'package:flutter_qualification/pages/login_page.dart';

void main(List<String> args) {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => MainState();

  static MainState of(BuildContext context) {
    return context.findAncestorStateOfType<MainState>()!;
  }
}

class MainState extends State<Main> {
  ThemeMode _themeMode = ThemeMode.light;

  void setTheme(String theme) {
    setState(() {
      _themeMode = theme == 'Light' ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StucKC in the Movie",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const LoginPage(),
      themeMode: _themeMode,
    );
  }
}