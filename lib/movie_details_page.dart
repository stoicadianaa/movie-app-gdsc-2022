import 'package:flutter/material.dart';
import 'package:movie_project/movie_genres.dart';

import 'movie_class.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.movie);

  Movie movie;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
      children: [
        Stack(
          children: [
            Image.network(
              movie.imageLink,
              width: width,
              height: width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 10.0,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopButtonWidget(
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  TopButtonWidget(
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('${movie.ratingIMDb}/10'),
                      Text(
                        'IMDb',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${movie.ratingRottenTomatoes}%',
                      ),
                      Text(
                        'Rotten Tomatoes',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('${movie.ratingIGN}/10'),
                      Text(
                        'IGN',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  movie.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children:  [
              //     Chip(label: Text(movie.genres[0])),
              //     SizedBox(
              //       width: 8.0,
              //     ),
              //     Chip(label: Text(movie.genres[1])),
              //   ],
              // ),
              SizedBox(
                height: 40.0,
                child: ListView.builder(
                  itemCount: movie.genres.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Chip(
                          label: Text(movie.genres[index].getDisplayName())),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Eddie-Redmayne.jpg'),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Johnny-Depp.jpg'),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('images/Jude-Law.jpg'),
                      radius: 30.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('images/Katherine-Waterston.jpg'),
                      radius: 30.0,
                    ),
                  ],
                ),
              ),
              Text(
                movie.description,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(Icons.credit_card_rounded),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text('Booking')
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

class TopButtonWidget extends StatelessWidget {
  const TopButtonWidget({
    required this.child,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
        child: child);
  }
}
