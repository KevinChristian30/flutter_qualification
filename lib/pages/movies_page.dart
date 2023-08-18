import 'package:flutter/material.dart';
import 'package:flutter_qualification/models/movie_model.dart';
import 'package:flutter_qualification/pages/movie_detail_page.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _HomePageState();
}

class _HomePageState extends State<MoviesPage> {
  void handleNavigate(String title) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailPage(title: title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Movies",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 32),
        ListView(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          children: Movie.movies.map((movie) {
            return Row(
              children: [
                Image.asset(
                  movie.path,
                  width: 150,
                  height: 250,
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      movie.description,
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Price: ${movie.price}',
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {handleNavigate(movie.title);}, 
                      child: const Text("Details")
                    )
                  ],
                ),
              ],
            );
          }).toList(),
        )
      ]
    );
  }
}