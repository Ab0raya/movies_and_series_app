import 'package:flutter/material.dart';
import 'package:movie/services/get_movies_service.dart';
import 'package:movie/models/movie_model.dart';
import 'package:movie/widgets/movie_item.dart';
import '../helper/colors.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  static String id = 'MoviesPage';

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  ScrollController controller = ScrollController();
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
                const Text(
                  'Movies',
                  style: TextStyle(
                    color: a6,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: GetMovies().getAllMovies(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<MovieModel> movies = snapshot.data!;
                        return ListView.builder(
                          controller: controller,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return MovieItem(movie: movies[index], height: 200, width: double.infinity, visibleContent: true,);
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
}
