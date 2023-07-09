import 'package:movie/models/tv_show_model.dart';
import '../helper/api.dart';

class GetTvShows {
  Future<List<TvShowModel>> getAllTvShows() async {
    List<TvShowModel> tvShows = [];
    for(int j = 1 ; j<5 ; j++){
      Map<String, dynamic> data =
      await Api().get(url:'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=$j&sort_by=popularity.desc');
      List results = data['results'];
      for (int i = 0; i < results.length; i++) {
        tvShows.add(TvShowModel.fromJson(data['results'][i]));
      }
    }


    return tvShows;
  }
}
