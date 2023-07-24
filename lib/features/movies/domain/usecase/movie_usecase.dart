import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/features/movies/domain/model/movie_model.dart';
import 'package:movies_app/features/movies/domain/repository/movie_repository.dart';

class MovieUseCase implements BaseOutUseCase<DataMovieModel> {
  final MovieRepository _movieRepository;
  MovieUseCase(this._movieRepository);
  @override
  Future<Either<Failure, DataMovieModel>> execute() async {
    return await _movieRepository.getNowPlayingMovies();
  }
}
