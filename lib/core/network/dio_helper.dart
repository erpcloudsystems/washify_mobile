import 'dart:developer';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import '../resources/constance.dart';
import 'exceptions.dart';

abstract class BaseDioHelper {
  Future<dynamic> post({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    Duration? timeOut,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    // We use this condition because Token won't be needed in signing.
    bool isSign = false,
  });

  Future<dynamic> get({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    bool loggedIn = true,
    Duration? timeOut,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
  });

  Future<dynamic> patch({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    Duration? timeOut,
  });

  Future<dynamic> delete({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    Duration? timeOut,
  });
}

class DioHelper implements BaseDioHelper {
  final SharedPreferences dioPrefs;
  late final PersistCookieJar cookieJar;
  final Dio dio;
  final String cookiePath;

  DioHelper({required this.dioPrefs, required this.cookiePath})
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiConstance.baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 30),
          ),
        ) {
    initializeCookieJar();
  }

  void initializeCookieJar() {
    cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$cookiePath/.cookies/"),
    );
    dio.interceptors.add(CookieManager(cookieJar));
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }
  }

  @override
  Future get({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    bool loggedIn = true,
    String? base,
    data,
    Duration? timeOut,
    String? token,
    query,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      // if (dioPrefs.getBool(isLoggedInKey) == true)
      //   'Authorization':
      //       'token ${dioPrefs.getString(apiKey)}:${dioPrefs.getString(apiSecretKey)}',
    };
    return await request(
        call: () async => await dio.get(
              endPoint,
              cancelToken: cancelToken,
              queryParameters: query,
            ));
  }

  @override
  Future post({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    bool isSign = false,
    Duration? timeOut,
    String? base,
    String? token,
    data,
    query,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      // if (dioPrefs.getBool(isLoggedInKey) == true)
      //   'Authorization':
      //       'token ${dioPrefs.getString(apiKey)}:${dioPrefs.getString(apiSecretKey)}',
    };

    return await request(
        call: () async => await dio.post(
              endPoint,
              data: data,
              queryParameters: query,
              onSendProgress: progressCallback,
              cancelToken: cancelToken,
            ));
  }

  @override
  Future patch({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    data,
    query,
    Duration? timeOut,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      // if (dioPrefs.getBool(isLoggedInKey) == true)
      //   'Authorization':
      //       'token ${dioPrefs.getString(apiKey)}:${dioPrefs.getString(apiSecretKey)}',
    };

    return await request(
        call: () async => await dio.patch(
              endPoint,
              data: data,
              queryParameters: query,
              onSendProgress: progressCallback,
              cancelToken: cancelToken,
            ));
  }

  @override
  Future delete({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    String? token,
    data,
    query,
    Duration? timeOut,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      // if (dioPrefs.getBool(isLoggedInKey) == true)
      //   'Authorization':
      //       'token ${dioPrefs.getString(apiKey)}:${dioPrefs.getString(apiSecretKey)}',
    };

    return await request(
        call: () async => await dio.delete(
              endPoint,
              data: data,
              queryParameters: query,
              cancelToken: cancelToken,
            ));
  }
}

extension on DioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final r = await call.call();
      return r;
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        dioPrefs.setBool(isLoggedInKey, false);
        dioPrefs.setBool(isLoggedInKey, false);
        dioPrefs.remove(sid);
      }
      throw PrimaryServerException(
        code: e.response?.statusCode ?? 100,
        error: e.error.toString(),
        message: e.response?.data['message'] ?? e.response!.toString(),
      );
    } catch (e) {
      log(e.toString());
      PrimaryServerException exception = e as PrimaryServerException;
      throw PrimaryServerException(
        error: exception.error,
        code: exception.code,
        message: exception.message,
      );
    }
  }
}
