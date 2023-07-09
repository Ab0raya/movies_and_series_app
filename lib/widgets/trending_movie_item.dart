import 'package:flutter/material.dart';
import 'package:movie/models/trending_movie_model.dart';

import '../helper/colors.dart';

class TrendingMovieItem extends StatelessWidget {
  const TrendingMovieItem({super.key, required this.trendingMovie});

  final TrendingMovieModel trendingMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original/${trendingMovie.backdropPath}')),
                color: a6,
                borderRadius: BorderRadius.circular(30)),
          ),
          Container(
            alignment: Alignment.bottomRight,
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                  Colors.black
                ],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: Text(
                trendingMovie.title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
