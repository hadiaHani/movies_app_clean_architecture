class DataMovieModel {
  List<MovieModel>? movies;

  DataMovieModel({required this.movies});
}

class MovieModel {
  final int id;
  final String title;
  final String? backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const MovieModel({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });
}
