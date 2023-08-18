import 'package:flutter/material.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _HomePageState();
}

class _HomePageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: const [
        Text(
          "Movies",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
      ]
    );
  }
}