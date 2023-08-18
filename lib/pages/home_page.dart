import 'package:flutter/material.dart';

enum Theme { light, dark }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Theme? selectedTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Home",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            PopupMenuButton<Theme>(
              initialValue: selectedTheme,
              onSelected: (Theme item) {
                setState(() {
                  selectedTheme = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Theme>>[
                const PopupMenuItem<Theme>(
                  value: Theme.light,
                  child: Text('Light'),
                ),
                const PopupMenuItem<Theme>(
                  value: Theme.dark,
                  child: Text('Dark'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          "About Us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
        const SizedBox(height: 16),
        Image.asset(
          "assets/movie_theatre.jpg",
          width: 160,
        ),
        const SizedBox(height: 16),
        const Text(
          "StucKC in the Movie is a movbie theatre based in Indonesia, we provide movie the traditional movie theatre experience.",
          textAlign: TextAlign.center,
        ),
      ]
    );
  }
}