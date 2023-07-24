import 'package:movies_app/core/extension/extension.dart';
import 'package:movies_app/features/movies_detailes/data/response/recommendition_response.dart';
import 'package:movies_app/features/movies_detailes/domain/model/recommendation.dart';

extension RecommindionListMovieMapper on RecommendationListResponse {
  RecommndetionalListModel toDomain() {
    return RecommndetionalListModel(
      reList: results?.map((e) => e.toDomain()).toList(),
    );
  }
}

extension RecommindionMapper on RecommendationResponse {
  RecommendationModel toDomain() {
    return RecommendationModel(
        id: id.onNull(), backdropPath: backdropPath.onNull());
  }
}
