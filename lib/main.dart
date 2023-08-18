import 'package:flutter/material.dart';
import 'package:flutter_qualification/pages/home_page.dart';
import 'package:flutter_qualification/pages/login_page.dart';
import 'package:flutter_qualification/pages/main_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(const Learning());
}

class Learning extends StatelessWidget {
  const Learning({super.key});

  // final SharedPreferences prefs = await SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StucKC in the Movie",
      theme: ThemeData.light(),
      // home: const LoginPage(),
      home: MainPage(email: 'kevinchristian@gmail.com'),
    );
  }
}