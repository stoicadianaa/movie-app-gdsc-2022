class Movie {
  Movie({required this.ratingIMDb, required this.ratingRottenTomatoes, required this.ratingIGN, required this.name,
    required this.genres, required this.description, required this.imageLink});

  double ratingIMDb;
  int ratingRottenTomatoes;
  int ratingIGN;
  String name;
  List<String> genres;
  String description;
  String imageLink;

}