class TrendingMovieModel {
  final bool adult;
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<dynamic> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  TrendingMovieModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });


  factory TrendingMovieModel.fromJson(jsonData){
    return TrendingMovieModel(
        adult: jsonData['adult'],
        backdropPath: jsonData['backdrop_path'],
        id: jsonData['id'],
        title: jsonData['title'],
        originalLanguage: jsonData['original_language'],
        originalTitle: jsonData['original_title'],
        overview: jsonData['overview'],
        posterPath: jsonData['poster_path'],
        mediaType: jsonData['media_type'],
        genreIds: jsonData['genre_ids'],
        popularity: jsonData['popularity'],
        releaseDate: jsonData['release_date'],
        video: jsonData['video'],
        voteAverage: jsonData['vote_average'] is int ? jsonData['vote_average'].toDouble():jsonData['vote_average'],
        voteCount: jsonData['vote_count'],
    );
  }
}
