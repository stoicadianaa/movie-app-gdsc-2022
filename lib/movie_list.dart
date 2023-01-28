import 'package:flutter/material.dart';
import 'package:movie_project/movie_genres.dart';
import 'package:movie_project/widget/movie_list_tile.dart';
import 'movie_class.dart';
import 'movie_data.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int buttonEnabled = -1;
  MovieGenres? selectedGenre;

  List<Movie> getFilteredMovies() {
    if (buttonEnabled == -1) return MovieData.movieList;
    List<Movie> movies = MovieData.movieList.where((element) {
      return element.genres.contains(selectedGenre);
    }).toList();

    return movies;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MovieGenres.values.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: RawMaterialButton(
                    fillColor:
                        buttonEnabled != index ? Colors.grey[300] : Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    onPressed: () {
                      setState(() {
                        buttonEnabled != index
                            ? selectedGenre = MovieGenres.values[index]
                            : selectedGenre = null;
                        buttonEnabled != index
                            ? buttonEnabled = index
                            : buttonEnabled = -1;
                      });
                    },
                    child: Text(MovieGenres.values[index].getDisplayName()),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 8.0,),
          SizedBox(
            height: height - 94.0 - padding.top - padding.bottom,
            child: MovieListBuilder(
              width: width,
              movies: getFilteredMovies(),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieListBuilder extends StatelessWidget {
  const MovieListBuilder({
    Key? key,
    required this.width,
    required this.movies,
  }) : super(key: key);

  final double width;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemExtent: 200.0,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = movies[index];
        return MovieListTile(
          movie: movie,
          width: width,
        );
      },
    );
  }
}
