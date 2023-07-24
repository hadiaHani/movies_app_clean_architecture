import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/core/RenderStateDialog/state_renderer.dart';
import 'package:movies_app/core/cache/cache.dart';
import 'package:movies_app/features/movies_detailes/domain/model/movie_detailes_model.dart';
import 'package:movies_app/features/movies_detailes/domain/model/recommendation.dart';
import 'package:movies_app/features/movies_detailes/domain/usecase/movie_usecase.dart';
import 'package:movies_app/core/extension/extension.dart';
import 'package:movies_app/features/movies_detailes/domain/usecase/recommendition_movie_usecase.dart';

class MoviesDetailesController extends GetxController {
  late MovieDetailesModel movieDetail;
  List<RecommendationModel> recommndetionalMovies = [];
  final RecommndetionalMoviesUseCase _case =
      instance<RecommndetionalMoviesUseCase>();
  final MoviesDetailesUseCase _moviesDetailesUseCase =
      instance<MoviesDetailesUseCase>();
  String title = '';
  String backdropPath = '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg';
  String overview = '';
  String releaseDate = '';
  int id = -1;

  List<GenresModel> genres = [];
  int runtime = 0;
  double voteAverage = 0.0;

  @override
  void onInit() {
    super.onInit();

    getMoviesDetailes();
    movieRecommendation();
  }

  Future<void> movieRecommendation() async {
    BuildContext context = Get.context as BuildContext;
    (await _case.execute(
            RecommndetionalMoviesUseCaseInput(id: CacheData().getId()!)))
        .fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      recommndetionalMovies = r.reList!;

      update();
    });
  }

  resetData() {
    genres = movieDetail.genres!;
    title = movieDetail.title.onNull();
    backdropPath = movieDetail.backdropPath.onNull();
    id = movieDetail.id.onNull();
    overview = movieDetail.overview.onNull();
    releaseDate = movieDetail.releaseDate.onNull();
    runtime = movieDetail.runtime.onNull();
    voteAverage = movieDetail.voteAverage.onNull();

    update();
  }

  Future<void> getMoviesDetailes() async {
    BuildContext context = Get.context as BuildContext;
    (await _moviesDetailesUseCase
            .execute(MoviesDetailesUseCaseInput(id: CacheData().getId()!)))
        .fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      movieDetail = r;
      resetData();
      print("title is ${movieDetail.title}");
      print("id is ${movieDetail.id}");

      update();
    });
  }
}
