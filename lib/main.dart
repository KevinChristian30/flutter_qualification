import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_qualification/pages/login_page.dart';
import 'package:flutter_qualification/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main(List<String> args) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String theme = prefs.getString('Theme') ?? 'Light';
  prefs.setString('Theme', theme);
  runApp(Main(
    prefs: prefs,
  ));
}

// ignore: must_be_immutable
class Main extends StatelessWidget {
  SharedPreferences prefs;
  Main({super.key, required this.prefs});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: Key(prefs.getString("Theme") ?? 'Light'),
      title: "StucKC in the Movie",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: prefs.getString("Theme") == 'Light' ? ThemeMode.light : ThemeMode.dark,
      home: MainPage(email: 'kevinchristian@gmail.com'),
    );
  }
}