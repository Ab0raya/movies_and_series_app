class MovieModel {
  final bool adult;
  final String backdropPath;
  final List<dynamic> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(jsonData) {
    return MovieModel(
      adult: jsonData['adult'],
      backdropPath: jsonData['backdrop_path'],
      genreIds: jsonData['genre_ids'],
      id: jsonData['id'],
      originalLanguage: jsonData['original_language'],
      originalTitle: jsonData['original_title'],
      overview: jsonData['overview'],
      popularity: jsonData['popularity'],
      posterPath: jsonData['poster_path'],
      releaseDate: jsonData['release_date'],
      title: jsonData['title'],
      video: jsonData['video'],
      voteAverage: jsonData['vote_average'] is int ? jsonData['vote_average'].toDouble():jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
    );
  }
}
