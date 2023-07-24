import 'package:dartz/dartz.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/internet_checker/internet_checker.dart';
import 'package:movies_app/features/movies/data/data_source/movie_data_source.dart';
import 'package:movies_app/features/movies/data/mapper/movie_mapper.dart';
import 'package:movies_app/features/movies/domain/model/movie_model.dart';
import 'package:movies_app/features/movies/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final RemoteMovieDataSource _dataSource;
  final NetworkInfo networkInfo;

  MovieRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, DataMovieModel>> getNowPlayingMovies() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.getNowPlayingMovies();
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
