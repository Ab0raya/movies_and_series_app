import 'package:movie/models/trending_movie_model.dart';
import '../helper/api.dart';


class GetTrendingMovies{
  Future<List<TrendingMovieModel>> getAllTrendingMovies()async{
    List<TrendingMovieModel> trendingMovies = [];
    Map<String , dynamic> data = await Api().get(url: 'https://api.themoviedb.org/3/trending/movie/day?language=en-US');
    List results = data['results'];
    for(int i = 0; i < results.length; i++){
      trendingMovies.add(TrendingMovieModel.fromJson(data['results'][i]));
    }
    return trendingMovies;
  }
}