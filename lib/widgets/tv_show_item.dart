import 'package:flutter/material.dart';

import '../helper/colors.dart';
import '../models/tv_show_model.dart';

class TvShowItem extends StatelessWidget {
  const TvShowItem(
      {super.key,
      required this.tvShow,
      required this.height,
      required this.width,
      required this.visibleContent});

  final TvShowModel tvShow;

  final double height;

  final double width;

  final bool visibleContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(image:  poster(tvShow.backdropPath, tvShow.posterPath),fit: BoxFit.cover),
                  // image: DecorationImage(
                  //     image: visibleContent? NetworkImage('https://image.tmdb.org/t/p/original/${tvShow.backdropPath}')
                  //         : NetworkImage('https://image.tmdb.org/t/p/original/${tvShow.posterPath}'),
                  //     fit: BoxFit.cover),
                  color: a6,
                  borderRadius: BorderRadius.circular(30)),
            ),
            Visibility(
              visible: visibleContent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tvShow.name.length > 20
                          ? '${tvShow.name.substring(0, 19)} \n ${tvShow.name.substring(19, tvShow.name.length)}'
                          : tvShow.name,
                      style: const TextStyle(
                          color: a6, fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                          size: 30,
                        ),
                        Text(
                          '${tvShow.voteAverage}',
                          style: const TextStyle(
                              color: a6,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   poster(String? backDrop,String? poster){
    if(visibleContent && tvShow.backdropPath != null){
      return NetworkImage('https://image.tmdb.org/t/p/original/$backDrop');
    }if (!visibleContent && tvShow.posterPath != null){
      return NetworkImage('https://image.tmdb.org/t/p/original/$poster');
    }
    if(visibleContent && tvShow.backdropPath == null){
      return const NetworkImage('https://www.ira-sme.net/wp-content/themes/consultix/images/no-image-found-360x260.png');
    }if (!visibleContent && tvShow.posterPath != null){
      return const NetworkImage('https://cdn.vectorstock.com/i/preview-1x/82/99/no-image-available-like-missing-picture-vector-43938299.jpg');
    }
  }

}
