import 'package:movies_app/features/movies/data/response/movie_response.dart';
import 'package:movies_app/features/movies/domain/model/movie_model.dart';
import 'package:movies_app/core/extension/extension.dart';

extension DataMovieMapper on DataMovie {
  DataMovieModel toDomain() {
    return DataMovieModel(movies: movie?.map((e) => e.toDomain()).toList());
  }
}

extension MoviesMapper on MovieResponse {
  MovieModel toDomain() {
    return MovieModel(
        backdropPath: backdropPath.onNull(),
        id: id.onNull(),
        genreIds: genreIds.onNull(),
        title: title.onNull(),
        overview: overview.onNull(),
        releaseDate: releaseDate.onNull(),
        voteAverage: voteAverage.onNull());
  }
}
