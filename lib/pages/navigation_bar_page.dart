import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/movies_page.dart';
import 'package:movie/pages/tv_shows_page.dart';
import '../helper/colors.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  static String id = 'HomePage';

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  List pages = [
    const HomePage(),
    const MoviesPage(),
    const TvShowsPage(),
  ];
  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: a1,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          pages[currentIndex],
          Positioned(
            bottom: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: 100,
                  width: 350,
                  color: a1.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 0;
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.houseChimney,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Visibility(
                                visible: currentIndex == 0 && currentIndex != 2 && currentIndex != 1  ? true : false,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text('Home',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 1;
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.film,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Visibility(
                                visible: currentIndex == 1 && currentIndex != 2 && currentIndex != 0 ? true : false,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text('Movies',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    currentIndex = 2;
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.photoFilm,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Visibility(
                                visible: currentIndex == 2 && currentIndex != 0 && currentIndex != 1 ? true : false,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text('Tv Shows',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w300),),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
