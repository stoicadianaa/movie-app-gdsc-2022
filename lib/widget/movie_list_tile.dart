import 'package:flutter/material.dart';
import 'package:movie_project/movie_genres.dart';
import '../movie_class.dart';
import '../movie_details_page.dart';

class MovieListTile extends StatelessWidget {
  const MovieListTile({
    Key? key,
    required this.movie,
    required this.width,
  }) : super(key: key);

  final Movie movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: 150.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(movie.imageLink),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [
                    // BoxShadow(
                    //   color: Colors.green,
                    //   blurRadius: 15.0
                    // ),
                    // BoxShadow(
                    //     color: Colors.pink,
                    //     blurRadius: 15.0,
                    //   offset: Offset(10,10)
                    // ),
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(10,10)
                    )
                  ]
              ),
            ),
            SizedBox(
              width: width / 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      movie.genres.map((e) => e.getDisplayName()).join(", "),
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                        "🍅 ${movie.ratingRottenTomatoes}% 🍿 ${movie.ratingIMDb}")
                  ],
                ),
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute (
            builder: (BuildContext context) => MovieDetailsPage(movie),
          ),
          );
        },
      ),
    );
  }
}