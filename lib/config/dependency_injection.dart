import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:movies_app/core/internet_checker/internet_checker.dart';
import 'package:movies_app/core/network/app_api.dart';
import 'package:movies_app/core/network/dio_factory.dart';
import 'package:movies_app/core/storage/local/app_settings_shared_preferences.dart';
import 'package:movies_app/features/movies/data/data_source/movie_data_source.dart';
import 'package:movies_app/features/movies/data/data_source/popular_movie_data_source.dart';
import 'package:movies_app/features/movies/data/data_source/top_rated_movie_data_source.dart';
import 'package:movies_app/features/movies/data/repository_impl/movie_repository_impl.dart';
import 'package:movies_app/features/movies/data/repository_impl/popular_movie_repository_impl.dart';
import 'package:movies_app/features/movies/data/repository_impl/top_rated_movie_repository_impl.dart';
import 'package:movies_app/features/movies/domain/repository/movie_repository.dart';
import 'package:movies_app/features/movies/domain/repository/popular_movie_repository.dart';
import 'package:movies_app/features/movies/domain/repository/top_rated_movie_repository.dart';
import 'package:movies_app/features/movies/domain/usecase/movie_usecase.dart';
import 'package:movies_app/features/movies/domain/usecase/popular_movie_usecase.dart';
import 'package:movies_app/features/movies/domain/usecase/top_rated_movie_usecase.dart';
import 'package:movies_app/features/movies/presentation/contoller/home_controller.dart';
import 'package:movies_app/features/movies_detailes/data/data_source/movie_detailes_source.dart';
import 'package:movies_app/features/movies_detailes/data/data_source/recommendational_movie_data_source.dart';
import 'package:movies_app/features/movies_detailes/data/repository_impl/movie_detailes_repository_impl.dart';
import 'package:movies_app/features/movies_detailes/data/repository_impl/recommndetional_movie_repository_impl.dart';
import 'package:movies_app/features/movies_detailes/domain/repository/movie_detailes_repository.dart';
import 'package:movies_app/features/movies_detailes/domain/repository/recommindition_movie_repository.dart';
import 'package:movies_app/features/movies_detailes/domain/usecase/movie_usecase.dart';
import 'package:movies_app/features/movies_detailes/domain/usecase/recommendition_movie_usecase.dart';
import 'package:movies_app/features/movies_detailes/presentation/contoller/movies_detailes_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  instance.registerLazySingleton<AppSettingsSharedPreferences>(
      () => AppSettingsSharedPreferences(instance()));

  instance.registerLazySingleton(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppApi>(
    () => AppApi(dio),
  );

  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      InternetConnectionCheckerPlus(),
    ),
  );
}

initHome() {
  if (!GetIt.I.isRegistered<RemoteMovieDataSource>()) {
    instance.registerLazySingleton<RemoteMovieDataSource>(
      () => RemoteMovieDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<MovieRepository>()) {
    instance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<MovieUseCase>()) {
    instance.registerLazySingleton<MovieUseCase>(
      () => MovieUseCase(
        instance<MovieRepository>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<PopularRemoteMovieDataSource>()) {
    instance.registerLazySingleton<PopularRemoteMovieDataSource>(
      () => PopularRemoteMovieDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<PopularMovieRepository>()) {
    instance.registerLazySingleton<PopularMovieRepository>(
      () => PopularMovieRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<PopularMovieUseCase>()) {
    instance.registerLazySingleton<PopularMovieUseCase>(
      () => PopularMovieUseCase(
        instance<PopularMovieRepository>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<TopRatedRemoteMovieDataSource>()) {
    instance.registerLazySingleton<TopRatedRemoteMovieDataSource>(
      () => TopRatedRemoteMovieDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<TopRatedMovieRepository>()) {
    instance.registerLazySingleton<TopRatedMovieRepository>(
      () => TopRatedMovieRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<TopRatedMovieUseCase>()) {
    instance.registerLazySingleton<TopRatedMovieUseCase>(
      () => TopRatedMovieUseCase(
        instance<TopRatedMovieRepository>(),
      ),
    );
  }
  Get.put<HomeController>(HomeController());
}

initMovieDetailes() {
  if (!GetIt.I.isRegistered<RemoteMovieDetailesDataSource>()) {
    instance.registerLazySingleton<RemoteMovieDetailesDataSource>(
      () => RemoteMovieDetailesDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<MovieDetailesRepository>()) {
    instance.registerLazySingleton<MovieDetailesRepository>(
      () => MovieDetailesRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<MoviesDetailesUseCase>()) {
    instance.registerLazySingleton<MoviesDetailesUseCase>(
      () => MoviesDetailesUseCase(
        instance<MovieDetailesRepository>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RecommenditionMovieDataSource>()) {
    instance.registerLazySingleton<RecommenditionMovieDataSource>(
      () => RecommenditionMovieDataSourceImplement(
        instance<AppApi>(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RecommndetionalMovieRepository>()) {
    instance.registerLazySingleton<RecommndetionalMovieRepository>(
      () => RecommndetionalMovieRepositoryImpl(
        instance(),
        instance(),
      ),
    );
  }

  if (!GetIt.I.isRegistered<RecommndetionalMoviesUseCase>()) {
    instance.registerLazySingleton<RecommndetionalMoviesUseCase>(
      () => RecommndetionalMoviesUseCase(
        instance<RecommndetionalMovieRepository>(),
      ),
    );
  }
  Get.put<MoviesDetailesController>(MoviesDetailesController());
}
