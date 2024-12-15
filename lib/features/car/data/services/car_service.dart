import 'package:dio/dio.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import 'package:washify_mobile/core/network/dio_helper.dart';

import '../../../../core/global/dependencies_container.dart';

abstract interface class BaseCarServices {
  Future<List<String>> getBrands();
}

class CarServices extends BaseCarServices {
  final dio = sl<BaseDioHelper>();
  @override
  Future<List<String>> getBrands() async {
    final response =
        await dio.get(endPoint: ApiConstance.brandsEndPoint) as Response;
    return List.from(response.data['data'])
        .map((index) => index['name'].toString())
        .toList();
  }
}
