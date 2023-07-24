import 'package:dio/dio.dart';
import 'package:movies_app/config/constant.dart';
import 'package:movies_app/features/movies/data/response/movie_response.dart';
import 'package:movies_app/features/movies_detailes/data/response/movie_detailes_response.dart';
import 'package:movies_app/features/movies_detailes/data/response/recommendition_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(
    Dio dio, {
    String baseUrl,
  }) = _AppApi;

  @GET(ApiConstants.nowPlayingMoviesPath)
  Future<DataMovie> nowPlayingMoviesPath();

  @GET(ApiConstants.popularMoviesPath)
  Future<DataMovie> popularMoviesPath();

  @GET(ApiConstants.topRatedMoviesPath)
  Future<DataMovie> topRatedMoviesPath();

  @GET(ApiConstants.movieDetails)
  Future<MovieDetailesResponse> movieDetailes(
    @Path(ApiConstants.id) int id,
  );

  @GET(ApiConstants.recommendationPath)
  Future<RecommendationListResponse> movieRecommendation(
    @Path(ApiConstants.id) int id,
  );
}
