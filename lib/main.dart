import 'package:flutter/material.dart';
import 'package:movie_project/movie_list.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(
          colorScheme: const ColorScheme.light(primary: Colors.deepOrange)),
      darkTheme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
          primary: Colors.deepOrange,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const MovieList(),
    );
  }
}
