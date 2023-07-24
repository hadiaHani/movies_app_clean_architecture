import 'package:dartz/dartz.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/internet_checker/internet_checker.dart';
import 'package:movies_app/features/movies/data/data_source/top_rated_movie_data_source.dart';
import 'package:movies_app/features/movies/data/mapper/movie_mapper.dart';
import 'package:movies_app/features/movies/domain/model/movie_model.dart';
import 'package:movies_app/features/movies/domain/repository/top_rated_movie_repository.dart';

class TopRatedMovieRepositoryImpl implements TopRatedMovieRepository {
  final TopRatedRemoteMovieDataSource _dataSource;
  final NetworkInfo networkInfo;

  TopRatedMovieRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, DataMovieModel>> getTopRatedMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.getTopRatedMovies();
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    } else {
      return Left(
        Failure(
          ResponseCode.NO_INTERNET_CONNECTION.value,
          ApiConstants.noInternetConnection,
        ),
      );
    }
  }
}
