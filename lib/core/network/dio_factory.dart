import 'package:movies_app/config/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      ApiConstants.authorization: ApiConstants.authorizationBearer,
      ApiConstants.accept: ApiConstants.applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: headers,
      sendTimeout: const Duration(
        seconds: ApiConstants.sendTimeOutDuration,
      ),
      receiveTimeout: const Duration(
        seconds: ApiConstants.receiveTimeOutDuration,
      ),
    );

    InterceptorsWrapper interceptorsWrapper = InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      options.headers[ApiConstants.authorization] =
          ApiConstants.authorizationBearer;
      return handler.next(options);
    });

    dio.interceptors.add(interceptorsWrapper);

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );
    }

    return dio;
  }
}
