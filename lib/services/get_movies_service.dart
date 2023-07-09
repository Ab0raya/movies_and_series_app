import 'package:movie/models/movie_model.dart';
import '../helper/api.dart';


class GetMovies{
  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> movies = [];
    for(int j =1 ; j<5 ; j++){
      Map <String, dynamic> data =
      await Api().get(url: 'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      List results = data['results'];
      for(int i = 0; i < results.length; i++){

        movies.add(MovieModel.fromJson(data['results'][i]));

      }

    }return movies;

  }
}