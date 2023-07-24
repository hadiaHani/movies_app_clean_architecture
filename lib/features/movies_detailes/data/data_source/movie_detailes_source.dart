import 'package:movies_app/core/network/app_api.dart';
import 'package:movies_app/features/movies_detailes/data/response/movie_detailes_response.dart';

abstract class RemoteMovieDetailesDataSource {
  Future<MovieDetailesResponse> getMoviesDetailes(int id);
}

class RemoteMovieDetailesDataSourceImplement
    implements RemoteMovieDetailesDataSource {
  final AppApi _appApi;
  RemoteMovieDetailesDataSourceImplement(this._appApi);
  @override
  Future<MovieDetailesResponse> getMoviesDetailes(int id) async {
    return await _appApi.movieDetailes(id);
  }
}
