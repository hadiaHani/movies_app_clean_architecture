import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/config/dependency_injection.dart';
import 'package:movies_app/core/RenderStateDialog/state_renderer.dart';
import 'package:movies_app/features/movies/domain/model/movie_model.dart';
import 'package:movies_app/features/movies/domain/usecase/movie_usecase.dart';
import 'package:movies_app/features/movies/domain/usecase/popular_movie_usecase.dart';
import 'package:movies_app/features/movies/domain/usecase/top_rated_movie_usecase.dart';

class HomeController extends GetxController {
  List<MovieModel> nowPlayingMoviesList = [];
  List<MovieModel> popularMoviesList = [];
  List<MovieModel> topRatedMovieList = [];

  final MovieUseCase _movieUseCase = instance<MovieUseCase>();

  final PopularMovieUseCase _popularMovieUseCase =
      instance<PopularMovieUseCase>();
  final TopRatedMovieUseCase _topRatedMovieUseCase =
      instance<TopRatedMovieUseCase>();

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovies();
    getPopularMovies();
    getTopRatedMovies();
  }

  Future<void> getTopRatedMovies() async {
    BuildContext context = Get.context as BuildContext;
    (await _topRatedMovieUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      topRatedMovieList = r.movies!;

      print("topRatedMovieList is ${topRatedMovieList.length}");
      update();
    });
  }

  Future<void> getPopularMovies() async {
    BuildContext context = Get.context as BuildContext;
    (await _popularMovieUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      popularMoviesList = r.movies!;

      print("lengthpopularMoviesList is ${popularMoviesList.length}");
      update();
    });
  }

  Future<void> getNowPlayingMovies() async {
    BuildContext context = Get.context as BuildContext;
    (await _movieUseCase.execute()).fold((l) {
      dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: l.message,
          title: '',
          retryAction: () {
            Get.back();
          });
    }, (r) {
      nowPlayingMoviesList = r.movies!;

      print("lengthnowPlayingMoviesList is ${nowPlayingMoviesList.length}");
      update();
    });
  }
}
