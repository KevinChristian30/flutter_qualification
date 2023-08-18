import 'package:flutter/material.dart';
import 'package:flutter_qualification/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  String? currentTheme;

  Future<void> initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      currentTheme = prefs.getString("Theme");
    });
  }

  @override
  void initState() {
    super.initState();
    initializeSharedPreferences();
  }

  final List<String> movies = Movie.movies.map((movie) => movie.path).toList();

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
            PopupMenuButton<String>(
              initialValue: currentTheme,
              onSelected: (String theme) {
                prefs.setString('Theme', theme);
                setState(() {
                  currentTheme = theme;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Light',
                  child: Text('Light'),
                ),
                const PopupMenuItem<String>(
                  value: 'Dark',
                  child: Text('Dark'),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 56),
        const Text(
          "Popular Movies",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
        const SizedBox(height: 16),
        CarouselSlider(
        options: CarouselOptions(
          height: 400.0, 
          autoPlay: true, 
          autoPlayInterval: const Duration(seconds: 5)
        ),
        items: movies.map((path) {
          return Builder(
            builder: (BuildContext context) {
              return
                Image.asset(
                  path,
                  width: double.infinity,
                );
            },
          );
        }).toList(),
      ),
        const SizedBox(height: 56),
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
          "StucKC in the Movie is a movie theatre based in Indonesia, we provide movie the traditional movie theatre experience.",
          textAlign: TextAlign.center,
        ),
      ]
    );
  }
}