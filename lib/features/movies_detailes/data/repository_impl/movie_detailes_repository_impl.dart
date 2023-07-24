import 'package:dartz/dartz.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/internet_checker/internet_checker.dart';
import 'package:movies_app/features/movies_detailes/data/data_source/movie_detailes_source.dart';
import 'package:movies_app/features/movies_detailes/data/mapper/movie_detailes_mapper.dart';
import 'package:movies_app/features/movies_detailes/domain/model/movie_detailes_model.dart';
import 'package:movies_app/features/movies_detailes/domain/repository/movie_detailes_repository.dart';

class MovieDetailesRepositoryImpl implements MovieDetailesRepository {
  final RemoteMovieDetailesDataSource _dataSource;
  final NetworkInfo networkInfo;

  MovieDetailesRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, MovieDetailesModel>> getMoviesDetailes(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.getMoviesDetailes(id);
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
