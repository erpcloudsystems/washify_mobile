import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../../core/global/dependencies_container.dart';
import '../../../../../core/network/api_constant.dart';
import '../../../../../core/network/dio_helper.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/sign_up_request_model.dart';

abstract class AuthRepository {
  Future<UserModel> login({required LoginRequestModel loginRequestModel});
  Future<void> signUp({required SignUpRequestModel signUpRequestModel});
  Future<List<String>> getGovernorate();
}

class AuthAPI implements AuthRepository {
  final dio = sl<BaseDioHelper>();

  @override
  Future<UserModel> login(
      {required LoginRequestModel loginRequestModel}) async {
    final response = await dio.post(
      endPoint: ApiConstance.loginEndPoint,
      data: loginRequestModel.toMap(),
    ) as Response;

    final cookies = response.headers['set-cookie'];
    Map<String, String> cookieMap = {};
    if (cookies != null && cookies.isNotEmpty) {
      for (var cookie in cookies) {
        final parts = cookie.split(';');
        for (var part in parts) {
          final keyValue = part.split('=');
          if (keyValue.length == 2) {
            final key = keyValue[0].trim();
            final value = keyValue[1].trim();
            cookieMap[key] = value;
          }
        }
      }
    }

    cookieMap.forEach((key, value) {
      log('$key: $value');
    });
    return UserModel.fromMap(cookieMap);
  }

  @override
  Future<void> signUp({required SignUpRequestModel signUpRequestModel}) async {
    await dio.post(
      endPoint: ApiConstance.signUpEndPoint,
      data: signUpRequestModel.toMap(),
    );
  }

  @override
  Future<List<String>> getGovernorate() async {
    final response = await dio.get(endPoint: ApiConstance.governorateEndPoint);
    return (response.data['message'] as List)
        .map((item) => item['name'] as String)
        .toList();
  }
}
