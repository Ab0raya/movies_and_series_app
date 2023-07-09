import 'package:movie/models/trending_tv_show_model.dart';

import '../helper/api.dart';

class GetTrendingTvShowsService{



  Future<List<TrendingTvShowModel>> getAllTrendingTvShows()async{
  List<TrendingTvShowModel> trendingTvShows = [];
  Map<String , dynamic> data = await Api().get(url: 'https://api.themoviedb.org/3/trending/tv/day?language=en-US');
  List results = data['results'];
  for(int i = 0; i < results.length; i++){
    trendingTvShows.add(TrendingTvShowModel.fromJson(data['results'][i]));
  }
  return trendingTvShows;
  }




}