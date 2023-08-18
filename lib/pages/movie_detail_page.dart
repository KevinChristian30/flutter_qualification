import 'package:flutter/material.dart';
import 'package:flutter_qualification/models/movie_model.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  String title;
  
  MovieDetailPage({super.key, required this.title});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie? movie;

  @override
  void initState() {
    super.initState();
    movie = Movie.findByTitle(widget.title);

    if (movie == null) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info)),
              Tab(icon: Icon(Icons.comment)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                const SizedBox(height: 32),
                Image.asset(
                  movie?.path ?? '',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 16),
                Text(
                  movie?.title ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  movie?.description ?? '',
                ),
                Text(
                  'Price: ${movie?.price ?? ''}',
                ),
                const SizedBox(height: 32),
              ],
            ),
            ListView(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              children: movie!.comments.map((comment) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment.commenterEmail,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        comment.content,
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ],
                  )
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}