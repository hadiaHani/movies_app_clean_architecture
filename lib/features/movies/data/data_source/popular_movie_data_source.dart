import 'package:movies_app/core/network/app_api.dart';
import 'package:movies_app/features/movies/data/response/movie_response.dart';

abstract class PopularRemoteMovieDataSource {
  Future<DataMovie> getPopularMovies();
}

class PopularRemoteMovieDataSourceImplement
    implements PopularRemoteMovieDataSource {
  final AppApi _appApi;
  PopularRemoteMovieDataSourceImplement(this._appApi);
  @override
  Future<DataMovie> getPopularMovies() async {
    return await _appApi.popularMoviesPath();
  }
}
