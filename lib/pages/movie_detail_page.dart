import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovieDetailPage extends StatefulWidget {
  String title;
  
  MovieDetailPage({super.key, required this.title});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}