class TvShowModel {
  final String? backdropPath;
  final String firstAirDate;
  final List<dynamic> genreIds;
  final int id;
  final String name;
  final List<dynamic> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;

  TvShowModel({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount});


  factory TvShowModel.fromJson(jsonData){
    return TvShowModel(
        backdropPath: jsonData['backdrop_path'] ,
        firstAirDate: jsonData['first_air_date'],
        genreIds: jsonData['genre_ids'],
        id: jsonData['id'],
        name: jsonData['name'],
        originCountry: jsonData['origin_country'],
        originalLanguage: jsonData['original_language'],
        originalName: jsonData['original_name'],
        overview: jsonData['overview'],
        popularity: jsonData['popularity'],
        posterPath: jsonData['poster_path'],
      voteAverage: jsonData['vote_average'] is int ? jsonData['vote_average'].toDouble():jsonData['vote_average'],
        voteCount: jsonData['vote_count'],
    );
  }
}
