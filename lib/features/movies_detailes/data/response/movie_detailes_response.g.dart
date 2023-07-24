// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detailes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailesResponse _$MovieDetailesResponseFromJson(
        Map<String, dynamic> json) =>
    MovieDetailesResponse(
      backdropPath: json['backdrop_path'] ?? "/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg",
      runtime: json['runtime'] as int?,
      id: json['id'] as int?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailesResponseToJson(
        MovieDetailesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'runtime': instance.runtime,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) => Genres(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
