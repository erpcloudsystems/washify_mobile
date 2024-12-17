import 'package:dio/dio.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import 'package:washify_mobile/core/network/dio_helper.dart';
import 'package:washify_mobile/features/subscription/data/models/subscription_model.dart';

import '../../../../core/global/dependencies_container.dart';

abstract interface class BaseSubscriptionServices {
  Future<List<SubscriptionModel>> getSubscriptions();
  Future<List<String>> getVisits();
}

class SubscriptionServices implements BaseSubscriptionServices {
  final dio = sl<BaseDioHelper>();
  @override
  Future<List<SubscriptionModel>> getSubscriptions() async {
    final response = await dio.get(
      endPoint: ApiConstance.getSubscriptionEndPoint,
      query: {'fields': '["*"]'},
    ) as Response;

    return List.from(response.data['data'])
        .map((item) => SubscriptionModel.fromMap(item))
        .toList();
  }

  @override
  Future<List<String>> getVisits() async {
    final response = await dio.get(
      endPoint: ApiConstance.getVisitsEndPoint,
      query: {'fields': '["*"]'},
    ) as Response;
    return List.from(response.data['data'])
        .map((item) => item['day_of_maintenance'] as String)
        .toList();
  }
}
