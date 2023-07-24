import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/features/movies_detailes/domain/model/movie_detailes_model.dart';

abstract class MovieDetailesRepository {
  Future<Either<Failure, MovieDetailesModel>> getMoviesDetailes(int id);
}
