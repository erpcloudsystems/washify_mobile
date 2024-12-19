import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../core/global/dependencies_container.dart';
import '../../../../core/network/api_constant.dart';
import '../../../../core/network/dio_helper.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/sign_up_request_model.dart';
import '../models/territory_model.dart';

abstract class AuthRepository {
  Future<UserModel> login({required LoginRequestModel loginRequestModel});
  Future<String> signUp({required SignUpRequestModel signUpRequestModel});
  Future<List<TerritoryModel>> getTerritories();
  Future<List<String>> getReferralSource();
}

class AuthAPI implements AuthRepository {
  final dio = sl<BaseDioHelper>();

  @override
  Future<UserModel> login({
    required LoginRequestModel loginRequestModel,
  }) async {
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
            final value = keyValue[1];
            cookieMap[key] = value;
          }
        }
      }
    }
    cookieMap = cookieMap
        .map((key, value) => MapEntry(key, Uri.decodeComponent(value)));

    cookieMap.forEach((key, value) {
      log('$key: $value');
    });

    return UserModel.fromMap(cookieMap);
  }

  @override
  Future<String> signUp(
      {required SignUpRequestModel signUpRequestModel}) async {
    final response = await dio.post(
      endPoint: ApiConstance.signUpEndPoint,
      data: signUpRequestModel.toMap(),
    ) as Response;
    return response.data['message'].toString();
  }

  @override
  Future<List<TerritoryModel>> getTerritories() async {
    final response = await dio.get(
      endPoint: ApiConstance.governorateEndPoint,
      query: {
        'fields': '["*"]',
        'filters':
            '[["parent_territory", "like", "%egy%"],["is_group", "=", "0"]]',
      },
    ) as Response;
    return (response.data['data'] as List)
        .map((item) => TerritoryModel.fromJson(item))
        .toList();
  }

  @override
  Future<List<String>> getReferralSource() async {
    final response = await dio.get(
      endPoint: ApiConstance.referralSourceEndPoint,
      query: {'fields': '["*"]'},
    ) as Response;
    return List.from(response.data['data'])
        .map((index) => index['name'].toString())
        .toList();
  }
}
