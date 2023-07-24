// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendition_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationListResponse _$RecommendationListResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendationListResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map(
              (e) => RecommendationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecommendationListResponseToJson(
        RecommendationListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

RecommendationResponse _$RecommendationResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendationResponse(
      backdropPath: json['backdrop_path'] ?? "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
      id: json['id'] as int?,
    );

Map<String, dynamic> _$RecommendationResponseToJson(
        RecommendationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
    };
