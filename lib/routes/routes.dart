import 'package:flutter/material.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/core/resourses/manager_strings.dart';
import 'package:movies_app/features/movies/presentation/view/movies_screen.dart';
import 'package:movies_app/features/movies/presentation/view/popular_movies_view.dart';
import 'package:movies_app/features/movies/presentation/view/top_rated_movies_view.dart';
import 'package:movies_app/features/movies_detailes/presentation/view/movie_detail_screen.dart';

class Routes {
  static const String homeView = '/home_view';
  static const String detailesView = '/detailes_view';
  static const String popularMovies = '/popular_movies';
  static const String topRatedMovies = '/top_rated_movies';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        initHome();

        return MaterialPageRoute(builder: (_) => const MoviesScreen());
      case Routes.detailesView:
        initMovieDetailes();
        return MaterialPageRoute(builder: (_) => const MovieDetailContent());
      case Routes.popularMovies:
        initHome();

        return MaterialPageRoute(builder: (_) => const PopularMoviesView());
      case Routes.topRatedMovies:
        initHome();

        return MaterialPageRoute(builder: (_) => const TopRatedMoviesView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(ManagerStrings.noRoutFound),
        ),
        body: const Center(
          child: Text(ManagerStrings.noRoutFound),
        ),
      ),
    );
  }
}
