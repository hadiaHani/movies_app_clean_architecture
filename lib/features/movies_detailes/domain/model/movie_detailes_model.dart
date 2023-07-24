class DataMovieModel {
  MovieDetailesModel? movieDetailesModel;

  DataMovieModel({required this.movieDetailesModel});
}

class MovieDetailesModel {
  String? backdropPath;
  List<GenresModel>? genres;
  int id;
  String overview;
  String releaseDate;
  int runtime;
  String title;
  double voteAverage;

  MovieDetailesModel({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });
}

class GenresModel {
  String? name;
  int? id;

  GenresModel({
    required this.name,
    required this.id,
  });
}
