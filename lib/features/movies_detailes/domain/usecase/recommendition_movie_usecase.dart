import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/features/movies_detailes/domain/model/recommendation.dart';
import 'package:movies_app/features/movies_detailes/domain/repository/recommindition_movie_repository.dart';

class RecommndetionalMoviesUseCaseInput {
  int id;
  RecommndetionalMoviesUseCaseInput({
    required this.id,
  });
}

class RecommndetionalMoviesUseCase
    implements
        BaseUseCase<RecommndetionalMoviesUseCaseInput,
            RecommndetionalListModel> {
  final RecommndetionalMovieRepository _movieRepository;
  RecommndetionalMoviesUseCase(this._movieRepository);
  @override
  Future<Either<Failure, RecommndetionalListModel>> execute(
      RecommndetionalMoviesUseCaseInput input) async {
    return await _movieRepository.movieRecommendation(input.id);
  }
}
