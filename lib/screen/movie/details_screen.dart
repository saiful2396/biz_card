import 'package:biz_card/models/movie.dart';
import 'package:biz_card/widget/constants.dart';
import 'package:flutter/material.dart';
import 'movie_ui_component/movie_details_ui.dart';

class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;
  MovieListViewDetails({this.movieName, this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        automaticallyImplyLeading: false,
        title: Text('Movie'),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          MovieDetailsThumbnail(thumbnail:movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          MovieDetailsCast(movie: movie,),
          MovieExtraPoster(poster: movie.images,)
        ],
      )
    );
  }
}

