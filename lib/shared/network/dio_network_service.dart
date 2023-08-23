
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:filmku/app/app_globals.dart';
import 'package:filmku/models/response/response.dart' as response;
import 'package:filmku/shared/network/network_service.dart';
import '../util/app_exception.dart';
import 'exception/mixin/network_handler_mixin.dart';
import 'network_values.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  late Dio dio;

  DioNetworkService() {
    dio = Dio();
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions => BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));

  @override
  String get baseUrl => dotenv.env[NetworkEnv.baseUrl.name] ?? '';

  @override
  String get apiKey => dotenv.env[NetworkEnv.apiKey.name] ?? '';

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeaders(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = headers;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endPoint, {Map<String, dynamic>? queryParams}) {
    queryParams ??= {};
    queryParams[Params.apiKey]=apiKey;
    final res = handleException(
      () => dio.get(
        endPoint,
        queryParameters: queryParams,
      ),
      endPoint: endPoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endPoint,
      {Map<String, dynamic>? data}) {
    // queryParams[Params.apiKey] = apiKey;
    final res = handleException(
        () => dio.post(
              endPoint,
              data: data,
            ),
        endPoint: endPoint);
    return res;
  }
}
