import 'package:movies_app/core/network/app_api.dart';
import 'package:movies_app/features/movies/data/response/movie_response.dart';

abstract class RemoteMovieDataSource {
  Future<DataMovie> getNowPlayingMovies();
}

class RemoteMovieDataSourceImplement implements RemoteMovieDataSource {
  final AppApi _appApi;
  RemoteMovieDataSourceImplement(this._appApi);
  @override
  Future<DataMovie> getNowPlayingMovies() async {
    return await _appApi.nowPlayingMoviesPath();
  }
}
