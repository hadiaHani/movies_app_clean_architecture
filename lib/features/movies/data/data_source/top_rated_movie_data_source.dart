import 'package:movies_app/core/network/app_api.dart';
import 'package:movies_app/features/movies/data/response/movie_response.dart';

abstract class TopRatedRemoteMovieDataSource {
  Future<DataMovie> getTopRatedMovies();
}

class TopRatedRemoteMovieDataSourceImplement
    implements TopRatedRemoteMovieDataSource {
  final AppApi _appApi;
  TopRatedRemoteMovieDataSourceImplement(this._appApi);
  @override
  Future<DataMovie> getTopRatedMovies() async {
    return await _appApi.topRatedMoviesPath();
  }
}
