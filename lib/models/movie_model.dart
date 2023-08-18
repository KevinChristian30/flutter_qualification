import 'package:flutter_qualification/models/comment_model.dart';

class Movie {
  String title;
  String description;
  String path;
  int price;
  List<Comment> comments;
  
  Movie(this.title, this.description, this.path, this.price, this.comments);

  static List<Movie> movies = [
    Movie("Spiderman", 
          "This is a Spiderman Movie", 
          "assets/movie_1.jpg", 
          1000,
          [
            Comment("kevin@gmail.com", "This is a bad movie"),
            Comment("jose@gmail.com", "This is a good movie"),
          ]
        ),
    Movie("Monster House", 
          "This is a Monster House Movie", 
          "assets/movie_2.jpg", 
          2000,
          [
            Comment("kevin@gmail.com", "This is a bad movie"),
            Comment("bryant@gmail.com", "This is a good movie"),
          ]
        ),
    Movie("Justice League", 
          "This is a Justice League Movie", 
          "assets/movie_3.jpg", 
          3000,
          [
            Comment("jose@gmail.com", "This is a bad movie"),
            Comment("bryant@gmail.com", "This is a good movie"),
          ]
      ),
    Movie("Avatar", 
          "This is an Avatar Movie", 
          "assets/movie_4.jpg", 
          4000,
          [
            Comment("kevin@gmail.com", "This is a bad movie"),
            Comment("bryant@gmail.com", "This is a good movie"),
            Comment("jose@gmail.com", "This is a average movie"),
          ]
      ),
    Movie("Back to the Future", 
          "This is a Back to the Future Movie",
          "assets/movie_5.jpg", 
          1000,
          [
            Comment("jose@gmail.com", "This is a bad movie"),
          ]    
      )
  ];
}