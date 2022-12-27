import 'package:flutter/material.dart';
import 'package:movie_project/widgets/movie_list_button.dart';
import 'movie_class.dart';
import 'movie_data.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movies List',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.85,
            child: ListView.builder(
              itemCount: MovieData.movieList.length,
              itemBuilder: (BuildContext context, int index) {
                Movie movie = MovieData.movieList[index];
                // return TextButton(onPressed: () {}, child: Text(MovieData.movieList[index].name));
                return MovieListButton(movie: movie, height: height, width: width);
              },
            ),
          ),
        ],
      ),
    );
  }
}
