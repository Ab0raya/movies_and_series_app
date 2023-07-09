import 'package:flutter/material.dart';
import 'package:movie/models/movie_model.dart';

import '../helper/colors.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie, required this.height, required this.width, required this.visibleContent});
  final MovieModel movie ;
  final double height ;
  final double width ;
  final bool visibleContent;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children:  [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(image: visibleContent? NetworkImage('https://image.tmdb.org/t/p/original/${movie.backdropPath}'):NetworkImage('https://image.tmdb.org/t/p/original/${movie.posterPath}'),fit: BoxFit.cover),
                  color: a6, borderRadius: BorderRadius.circular(30)),

            ),
             Visibility(
               visible: visibleContent,
               child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(movie.title.length > 20 ? '${movie.title.substring(0,19)} \n ${ movie.title.substring(19,movie.title.length)}': movie.title ,
                      style: const TextStyle(color: a6,fontSize: 30,fontWeight: FontWeight.w600),),
                    Row(
                      children: [
                        const Icon(Icons.star,color: Colors.yellowAccent,size:30 ,),
                        Text('${movie.voteAverage}',style: const TextStyle(color: a6,fontSize: 30,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ],
                ),
            ),
             ),],
        ),
      ),
    );
  }
}
