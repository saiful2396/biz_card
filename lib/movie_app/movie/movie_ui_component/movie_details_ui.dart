import 'package:biz_card/movie_app/movie/models/movie.dart';
import 'package:biz_card/movie_app/movie/util/constants.dart';
import 'package:flutter/material.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  MovieDetailsThumbnail({this.thumbnail});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover
                ),
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.white,),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00f5f5f5),
                Color(0xfff5f5f5),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80.0,
        ),
      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {

  final Movie movie;
  MovieDetailsHeaderWithPoster({this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(width: 16.0),
          Expanded(
            child: MovieDetailsHeader(movie: movie),
          ),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {

  final String poster;
  MoviePoster({this.poster});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {

  final Movie movie;
  MovieDetailsHeader({this.movie});

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${movie.year} . ${movie.genre}' .toUpperCase(),
          style: TextStyle(color: Colors.cyan,
              fontWeight: FontWeight.w400),
        ),
        Text(movie.title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
              color: kTitleColor
          ),),
        Text.rich(TextSpan(
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300,
              color: kSubTitleColor
          ),
          children: <TextSpan>[
            TextSpan(
                text: movie.plot
            ),
            TextSpan(
              text: 'More...',
              style: TextStyle(color: Colors.indigoAccent),
            ),
          ],
        ),),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {

  final Movie movie;
  MovieDetailsCast({this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: 'Cast', value: movie.actors),
          MovieField(field: 'Director', value: movie.director),
          MovieField(field: 'Writer', value: movie.writer),
          MovieField(field: 'Awards', value: movie.awards),
          MovieField(field: 'Country', value: movie.country),
          MovieField(field: 'Language', value: movie.language),
          MovieField(field: 'Type', value: movie.type),
          MovieField(field: 'Response', value: movie.response),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {

  final String field;
  final String value;
  MovieField({this.field, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$field : ', style: TextStyle(
            color: Colors.lightBlueAccent, fontSize: 14,
            fontWeight: FontWeight.w300
        ),),
        Expanded(
          child: Text(value, style: TextStyle(
              color: Colors.lightBlueAccent, fontSize: 14,
              fontWeight: FontWeight.w300
          ),),
        ),
      ],
    );
  }
}

class MovieExtraPoster extends StatelessWidget {

  final List<String> poster;
  MovieExtraPoster({this.poster});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('More Movie Poster', style: TextStyle(
            color: Colors.white54, fontSize: 14,
          ),),
          SizedBox(height: 10.0,),
          Container(
            height: 190,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(poster[index]),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 8.0,),
                itemCount: poster.length
            ),
          ),
        ],
      ),
    );
  }
}