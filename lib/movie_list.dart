import 'package:flutter/material.dart';
import 'movie_class.dart';
import 'movie_data.dart';
import 'movie_details_page.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (BuildContext context) => const MovieDetailsPage(),
          //       ),
          //     );
          //   },
          //   child: Text('Descriere film'),
          // ),
          SizedBox(
            height: 50.0 * MovieData.movieList.length,
            child: ListView.builder(
              itemCount: MovieData.movieList.length,
              itemBuilder: (BuildContext context, int index) {
                Movie movie = MovieData.movieList[index];
                // return TextButton(onPressed: () {}, child: Text(MovieData.movieList[index].name));
                return TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsPage(MovieData.movieList[index])));
                    },
                    child: Text(movie.name));
              },
            ),
          ),
        ],
      ),
    );
  }
}
