import 'package:dio/dio.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import 'package:washify_mobile/core/network/dio_helper.dart';
import 'package:washify_mobile/features/car/data/models/request_service_model.dart';

import '../../../../core/global/dependencies_container.dart';

abstract interface class BaseCarServices {
  Future<List<String>> getBrands();
  Future<void> createRequestService(RequestServiceModel model);
  Future<List<RequestServiceModel>> getCars();
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

  @override
  Future<void> createRequestService(RequestServiceModel model) async {
    await dio.post(
      endPoint: ApiConstance.requestServiceEndPoint,
      data: model.toMap(),
    ) as Response;
  }

  @override
  Future<List<RequestServiceModel>> getCars() async {
    final response = await dio.get(
      endPoint: ApiConstance.requestServiceEndPoint,
      query: {'fields' : '["*"]'}
    ) as Response;
    return List.from(response.data['data'])
        .map((item) => RequestServiceModel.fromMap(item))
        .toList();
  }
}
