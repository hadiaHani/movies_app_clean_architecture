import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error_handler/error_handler.dart';
import 'package:movies_app/features/movies_detailes/domain/model/recommendation.dart';

abstract class RecommndetionalMovieRepository {
  Future<Either<Failure, RecommndetionalListModel>> movieRecommendation(int id);
}
