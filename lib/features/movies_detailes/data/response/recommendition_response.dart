import 'package:json_annotation/json_annotation.dart';
part 'recommendition_response.g.dart';

@JsonSerializable()
class RecommendationListResponse {
  @JsonKey(name: "results")
  List<RecommendationResponse>? results;

  RecommendationListResponse({this.results});
  factory RecommendationListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendationListResponseToJson(this);
}

@JsonSerializable()
class RecommendationResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;

  RecommendationResponse({
    this.backdropPath,
    this.id,
  });
  factory RecommendationResponse.fromJson(Map<String, dynamic> json) =>
      _$RecommendationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendationResponseToJson(this);
}
