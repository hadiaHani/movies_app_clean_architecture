import 'package:movies_app/core/extension/extension.dart';
import 'package:movies_app/features/movies_detailes/data/response/movie_detailes_response.dart';
import 'package:movies_app/features/movies_detailes/domain/model/movie_detailes_model.dart';

extension MovieDetailesMapper on MovieDetailesResponse {
  MovieDetailesModel toDomain() {
    return MovieDetailesModel(
        genres: genres?.map((e) => e.toDomain()).toList(),
        backdropPath: backdropPath.onNull(),
        id: id.onNull(),
        overview: overview.onNull(),
        releaseDate: releaseDate.onNull(),
        runtime: runtime.onNull(),
        title: title.onNull(),
        voteAverage: voteAverage.onNull());
  }
}

extension GenresMapper on Genres {
  GenresModel toDomain() {
    return GenresModel(id: id.onNull(), name: name.onNull());
  }
}
