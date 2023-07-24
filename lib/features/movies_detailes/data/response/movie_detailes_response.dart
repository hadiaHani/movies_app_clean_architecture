import 'package:json_annotation/json_annotation.dart';
part 'movie_detailes_response.g.dart';

@JsonSerializable()
class MovieDetailesResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "runtime")
  int? runtime;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "genres")
  List<Genres>? genres;
  MovieDetailesResponse(
      {this.backdropPath,
      this.runtime,
      this.id,
      this.overview,
      this.releaseDate,
      this.title,
      this.voteAverage,
      this.genres});
  factory MovieDetailesResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailesResponseToJson(this);
}

@JsonSerializable()
class Genres {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  Genres({this.id, this.name});
  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);
}
