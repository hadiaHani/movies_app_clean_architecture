import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/features/movies/domain/model/movie_model.dart';

abstract class PopularMovieRepository {
  Future<Either<Failure, DataMovieModel>> getPopularMovies();
}
