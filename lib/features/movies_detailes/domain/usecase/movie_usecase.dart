import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/features/movies_detailes/domain/model/movie_detailes_model.dart';
import 'package:movies_app/features/movies_detailes/domain/repository/movie_detailes_repository.dart';

class MoviesDetailesUseCaseInput {
  int id;
  MoviesDetailesUseCaseInput({
    required this.id,
  });
}

class MoviesDetailesUseCase
    implements BaseUseCase<MoviesDetailesUseCaseInput, MovieDetailesModel> {
  final MovieDetailesRepository _repository;
  MoviesDetailesUseCase(this._repository);
  @override
  Future<Either<Failure, MovieDetailesModel>> execute(
      MoviesDetailesUseCaseInput input) async {
    return await _repository.getMoviesDetailes(input.id);
  }
}
