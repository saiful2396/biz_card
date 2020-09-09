import 'package:biz_card/models/movie.dart';
import 'package:biz_card/screen/movie/details_screen.dart';
import 'package:biz_card/widget/constants.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  static const id = 'home_screen';
  final List<Movie> movieList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('Movie'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, int index) {
            return Stack(
              children: [
                movieCard(movieList[index], context),
                Positioned(
                  top: 10.0,
                  child: movieImage(movieList[index].images[0]),
                ),
              ],
            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MovieListViewDetails(
            movieName: movie.title, movie: movie,
          ),
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        margin: EdgeInsets.only(left: 55),
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: EdgeInsets.fromLTRB(40.0, 8.0, 0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          movie.title,
                          style: kTitleTextStyle,
                        ),
                      ),
                      Text(
                        'Rate: ${movie.imdbRating} / 10',
                        style: kSubTitleTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('${movie.rated} |', style: kSubTitleTextStyle),
                      Flexible(
                        child: Text(movie.genre, style: kSubTitleTextStyle),
                      ),
                      Text('| ${movie.runtime}',
                          style: kSubTitleTextStyle),
                      Text('| ${movie.year}',
                          style: kSubTitleTextStyle),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget movieImage(String imgUrl) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage(imgUrl ?? Icon(Icons.error)),
            fit: BoxFit.cover),
      ),
    );
  }
}
