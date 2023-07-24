import 'package:json_annotation/json_annotation.dart';
part 'movie_response.g.dart';

@JsonSerializable()
class DataMovie {
  @JsonKey(name: "results")
  List<MovieResponse>? movie;
  DataMovie({this.movie});

  factory DataMovie.fromJson(Map<String, dynamic> json) =>
      _$DataMovieFromJson(json);
  Map<String, dynamic> toJson() => _$DataMovieToJson(this);
}

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "release_date")
  String? releaseDate;
  MovieResponse(
      {this.backdropPath,
      this.genreIds,
      this.id,
      this.overview,
      this.releaseDate,
      this.title,
      this.voteAverage});
  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
