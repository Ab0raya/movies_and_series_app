import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/models/trending_movie_model.dart';
import 'package:movie/services/get_trending_movies_service.dart';
import 'package:movie/widgets/search_bar.dart';
import 'package:movie/widgets/trending_movie_item.dart';

import '../helper/colors.dart';
import '../models/movie_model.dart';
import '../models/tv_show_model.dart';
import '../services/get_movies_service.dart';
import '../services/get_tv_shows_service.dart';
import '../widgets/movie_item.dart';
import '../widgets/side_title.dart';
import '../widgets/tv_show_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int cardIndex = 0;

  var controller = PageController(viewportFraction: 0.9);
  Timer? timer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      // el 2a5er
      if (cardIndex == 4) {
        cardIndex = 0;
      }
      if (controller.hasClients) {
        controller.animateToPage(
          cardIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
      }

      cardIndex++;
    });
  }

  @override
  void initState() {
    controller = PageController(initialPage: 0, viewportFraction: 0.9);
    timer = getTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 20, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, Adel !',
                  style: TextStyle(
                      color: a6, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://p16.tiktokcdn.com/musically-maliva-obj/1662300415797254~c5_720x720.jpeg'),
                ),
              ],
            ),
          ),
          const CustomSearchBar(
            hint: ' this search bar Dosen\'t work',
          ),
           const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SideTitle(text: 'Trending'),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child:  FutureBuilder(
                      future: GetTrendingMovies().getAllTrendingMovies(),
                      builder: (context, snapshot) {
                        if(snapshot.hasData){
                          List<TrendingMovieModel> trendingMovies = snapshot.data!;
                          return PageView.builder(
                            pageSnapping: false,
                            controller: controller,
                            onPageChanged: (index) {
                              setState(() {
                                cardIndex = index;
                              },);
                            },
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return  TrendingMovieItem(trendingMovie: trendingMovies[index],);
                            },
                          );
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                       
                      },
                  )

                ),
              ],
            ),
          ),
          dots(cardIndex),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 18),
            child: SideTitle(text: 'Movies'),
          ),
          SizedBox(
            height: 270,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: GetMovies().getAllMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<MovieModel> movies = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //  controller: controller,
                          itemCount: 22,
                          itemBuilder: (context, index) {
                            return MovieItem(
                              movie: movies[index],
                              height: 250,
                              width: 150,
                              visibleContent: false,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, top: 18),
            child: SideTitle(text: 'TV-Shows'),
          ),
          SizedBox(
            height: 270,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: GetTvShows().getAllTvShows(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<TvShowModel> tvShows = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //  controller: controller,
                          itemCount: 22,
                          itemBuilder: (context, index) {
                            return TvShowItem(
                                tvShow: tvShows[index],
                                height: 250,
                                width: 150,
                                visibleContent: false);
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dots(int containerIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: CircleAvatar(
            backgroundColor: containerIndex == index ? a6 : a4,
            radius: 5,
          ),
        );
      }),
    );
  }
}
