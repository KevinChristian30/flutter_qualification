import 'package:flutter/material.dart';
import 'package:flutter_qualification/models/comment_model.dart';
import 'package:flutter_qualification/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  String title;
  
  MovieDetailPage({super.key, required this.title});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Movie? movie;
  TextEditingController commentController = TextEditingController();

  SharedPreferences? prefs;

  void resetFormValues() {
    commentController.text = '';
  }

  void handleAddComment() {
    String comment = commentController.text;

    if (comment.length <= 5 || comment.length >= 30) {
      const snackBar = SnackBar(
        content: Text('Comment length must be between 5 and 30 characters long'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return;
    }

    setState(() {
      movie?.addComment(Comment(prefs!.getString('currentUserEmail') ?? 'kevin@gmail.com', comment));
    });

    const snackBar = SnackBar(
      content: Text('Comment Added'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    resetFormValues();
  }

  void intializeSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    movie = Movie.findByTitle(widget.title);

    if (movie == null) Navigator.pop(context);

    intializeSharedPreference();
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
            Container(
              padding: const EdgeInsets.all(24),
              child: Column(
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
                  const SizedBox(height: 64),
                  TextField(
                    controller: commentController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Add a Comment',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {handleAddComment();}, 
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: const Text("Add Comment"),
                  ),
                ],
              ),
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