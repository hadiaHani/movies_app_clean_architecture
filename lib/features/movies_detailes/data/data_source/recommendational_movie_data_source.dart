import 'package:movies_app/core/network/app_api.dart';
import 'package:movies_app/features/movies_detailes/data/response/recommendition_response.dart';

abstract class RecommenditionMovieDataSource {
  Future<RecommendationListResponse> movieRecommendation(int id);
}

class RecommenditionMovieDataSourceImplement
    implements RecommenditionMovieDataSource {
  final AppApi _appApi;
  RecommenditionMovieDataSourceImplement(this._appApi);
  @override
  Future<RecommendationListResponse> movieRecommendation(int id) async {
    return await _appApi.movieRecommendation(id);
  }
}
