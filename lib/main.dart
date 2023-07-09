import 'package:flutter/material.dart';
import 'package:movie/pages/navigation_bar_page.dart';
import 'package:movie/pages/movies_page.dart';
import 'package:movie/pages/tv_shows_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MoviesPage.id:(context)=> const MoviesPage(),
        TvShowsPage.id:(context)=>const TvShowsPage(),
        NavigationBarPage.id:(context)=>const NavigationBarPage(),
       '/':(context)=>const NavigationBarPage(),
      },
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
