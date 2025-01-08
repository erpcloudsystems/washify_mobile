import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import 'package:washify_mobile/core/network/dio_helper.dart';
import 'package:washify_mobile/core/resources/constance.dart';
import 'package:washify_mobile/features/car/data/models/address_model.dart';

import '../../../../core/global/dependencies_container.dart';

abstract interface class BaseCarServices {
  Future<List<String>> getBrands();
  Future<List<String>> getModelsByBrandName(String name);
  Future<void> createAddress(AddressModel model);
  Future<List<AddressModel>> getCars();
  Future<void> updateAddress(AddressModel model);
}

class CarServices extends BaseCarServices {
  final dio = sl<BaseDioHelper>();
  final String? user = sl<SharedPreferences>().getString(userId);
  @override
  Future<List<String>> getBrands() async {
    final response = await dio.get(
      endPoint: ApiConstance.brandsEndPoint,
      query: {
        'filters': '[["custom_is_parent", "=", "1"]]',
        "limit": 150,
      },
    ) as Response;

    return List.from(response.data['data'])
        .map((index) => index['name'].toString())
        .toList();
  }

  @override
  Future<List<String>> getModelsByBrandName(String name) async {
    final response = await dio.get(
      endPoint: ApiConstance.brandsEndPoint,
      query: {
        'filters': '[["custom_parent_brand", "=", "$name"]]',
        "limit": 150,
      },
    ) as Response;

    return List.from(response.data['data'])
        .map((index) => index['name'].toString())
        .toList();
  }

  @override
  Future<void> createAddress(AddressModel model) async {
    await dio.post(
      endPoint: ApiConstance.addressEndPoint,
      data: model.toMap(),
    ) as Response;
  }

  @override
  Future<List<AddressModel>> getCars() async {
    final response =
        await dio.get(endPoint: ApiConstance.addressEndPoint, query: {
      'fields': '["*"]',
      //'filters': '[["owner", "=", "$user"]]',
    }) as Response;
    return List.from(response.data['data'])
        .map((item) => AddressModel.fromMap(item))
        .toList();
  }

  @override
  Future<void> updateAddress(AddressModel model) async {
    await dio.post(
      endPoint: '${ApiConstance.addressEndPoint}/${model.id}',
      data: model.toMap(),
    ) as Response;
  }
}
