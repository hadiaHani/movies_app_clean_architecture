class Constant {
  static const double deviceWidth = 375;
  static const double deviceHeight = 812;
  static const int splashDuration = 3;
  static const int outBoardingDurationTime = 1;
  static const double elevationAppBar = 0;
  static const double elevationButton = 0;
  static const double getStateWidgetRenderStateElevation = 3;
  static const int loginTimer = 1;
  static const double arrowBackButtonElevation = 0;
  static const int codeVerificationMaxLine = 1;
  static const double elevation = 0;
  static const int unauthenticatedSession = 2;
}

class ApiConstants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "fbda02ee6fa6099e00fb107f3bf520b6";

  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String movieDetails =
      "$baseUrl/movie/{movie_id}?api_key=$apiKey";

  static const String id = "movie_id";
  static const String recommendationPath =
      "$baseUrl/movie/{movie_id}/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static const String token = 'token';
  static const int sendTimeOutDuration = 120;
  static const int receiveTimeOutDuration = 120;
  static const String authorization = 'Authorization';

  static const String authorizationBearer =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmYmRhMDJlZTZmYTYwOTllMDBmYjEwN2YzYmY1MjBiNiIsInN1YiI6IjY0YjE2YzkyZDIzNmU2MDBjNTg3MTNmOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2ZYmcjC10ymQsOZT2P9sj3jdfT5kfO7SnP9vJCahnyk";
  static const String message = 'message';
  static const String errors = 'errors';
  static const String error = 'error';
  static const String badRequest = 'Bad Request';
  static const String passwordConfirmation = 'password_confirmation';
  static const String phone = 'phone';
  static const String avatar = "avatar";
  static const String noInternetConnection = 'No Internet connection';
  static const String acceptLanguage = 'Accept-Language';
  static const String english = 'en';
  static const String arabic = 'ar';
  static const String isRated = "isRated";
  static const String type = "type";
  static const String attributes = "attributes";
  static const String status = 'status';
  static const String data = 'data';

  static const String accept = 'accept';

  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String fcmToken = 'fcm_token';
}
