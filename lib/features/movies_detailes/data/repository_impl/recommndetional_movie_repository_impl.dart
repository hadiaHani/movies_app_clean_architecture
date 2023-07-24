import 'package:dartz/dartz.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/core/internet_checker/internet_checker.dart';
import 'package:movies_app/features/movies_detailes/data/data_source/recommendational_movie_data_source.dart';
import 'package:movies_app/features/movies_detailes/data/mapper/recommindition_movie_mapper.dart';
import 'package:movies_app/features/movies_detailes/domain/model/recommendation.dart';
import 'package:movies_app/features/movies_detailes/domain/repository/recommindition_movie_repository.dart';

class RecommndetionalMovieRepositoryImpl
    implements RecommndetionalMovieRepository {
  final RecommenditionMovieDataSource _dataSource;
  final NetworkInfo networkInfo;

  RecommndetionalMovieRepositoryImpl(this._dataSource, this.networkInfo);

  @override
  Future<Either<Failure, RecommndetionalListModel>> movieRecommendation(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await _dataSource.movieRecommendation(id);
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
