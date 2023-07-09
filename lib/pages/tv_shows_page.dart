import 'package:flutter/material.dart';
import 'package:movie/models/tv_show_model.dart';
import 'package:movie/pages/movies_page.dart';
import 'package:movie/services/get_tv_shows_service.dart';
import 'package:movie/widgets/tv_show_item.dart';

import '../helper/colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'navigation_bar_page.dart';

class TvShowsPage extends StatelessWidget {
  const TvShowsPage({super.key});
  static  String id = 'TvShowsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: a1,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('TV-Shows',style: TextStyle(color: a6,fontSize: 30,fontWeight: FontWeight.w600),),
                Expanded(
                  child: FutureBuilder(
                    future:GetTvShows().getAllTvShows(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print('hasData');
                        List<TvShowModel> tvShows = snapshot.data!;
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return TvShowItem(
                                tvShow: tvShows[index],
                                height: 200,
                                width: double.infinity,
                                visibleContent: true,
                            );
                          },
                        );
                      } else {
                        print('has no data ${snapshot.data}');
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
}
