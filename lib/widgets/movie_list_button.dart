import 'package:flutter/material.dart';
import '../movie_class.dart';
import '../movie_details_page.dart';

class MovieListButton extends StatelessWidget {
  const MovieListButton({
    Key? key,
    required this.movie,
    required this.height,
    required this.width,
  }) : super(key: key);

  final Movie movie;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>
                MovieDetailsPage(movie),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height / 7 * 1.5,
              width: height / 7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    movie.imageLink,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                const BorderRadius.all(Radius.circular(16.0)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(4, 6), // Shadow position
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            SizedBox(
              width: width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    movie.genres.join(", "),
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('🍅 ${movie.ratingRottenTomatoes}%'),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text('🍿 ${movie.ratingIMDb}')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}