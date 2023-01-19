enum MovieGenres {action, adventure, animation, family, fantasy, drama, crime, thriller}
extension MovieGenresExtension on MovieGenres {
  String getDisplayName() {
    switch (this) {
      case MovieGenres.action:
        return 'Action';
      case MovieGenres.adventure:
        return 'Adventure';
      case MovieGenres.family:
        return 'Family';
      case MovieGenres.fantasy:
        return 'Fantasy';
      case MovieGenres.drama:
        return 'Drama';
      case MovieGenres.crime:
        return 'Crime';
      case MovieGenres.thriller:
        return 'Thriller';
      case MovieGenres.animation:
        return 'Thriller';
    }
  }
}
