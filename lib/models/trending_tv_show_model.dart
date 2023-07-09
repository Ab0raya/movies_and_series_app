class TrendingTvShowModel {
  final bool adult;
  final String backdropPath;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<dynamic> genreIds;
  final double popularity;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<dynamic> originCountry;

  TrendingTvShowModel({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.genreIds,
    required this.popularity,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });


  factory TrendingTvShowModel.fromJson(jsonData){
    return TrendingTvShowModel(
      adult: jsonData['adult'],
      backdropPath: jsonData['backdrop_path'],
      id: jsonData['id'],
      name: jsonData['name'],
      originalLanguage: jsonData['original_language'],
      originalName: jsonData['original_name'],
      overview: jsonData['overview'],
      posterPath: jsonData['poster_path'],
      mediaType: jsonData['media_type'],
      genreIds: jsonData['genre_ids'],
      popularity: jsonData['popularity'],
      firstAirDate: jsonData['first_air_date'],
      voteAverage: jsonData['vote_average'] is int ? jsonData['vote_average'].toDouble():jsonData['vote_average'],
      voteCount: jsonData['vote_count'],
      originCountry: jsonData['origin_country'],
    );
  }
}
