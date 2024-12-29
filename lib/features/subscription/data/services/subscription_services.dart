import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import 'package:washify_mobile/core/network/dio_helper.dart';
import 'package:washify_mobile/features/subscription/data/models/subscription_model.dart';

import '../../../../core/global/dependencies_container.dart';
import '../../../../core/resources/constance.dart';
import '../models/visit_model.dart';

abstract interface class BaseSubscriptionServices {
  Future<List<SubscriptionModel>> getSubscriptions();
  Future<List<VisitModel>> getVisits();
  Future<SubscriptionModel> getSubscription(String id);
}

class SubscriptionServices implements BaseSubscriptionServices {
  final dio = sl<BaseDioHelper>();
  final String? user = sl<SharedPreferences>().getString(userId);
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
  Future<List<VisitModel>> getVisits() async {
    final response = await dio.get(
      endPoint: ApiConstance.getVisitsEndPoint,
      // query: {
      //   'fields': '["*"]',
      //   'filters': '[["owner", "=", "$user"]]',
      // },
    ) as Response;
    return List.from(response.data['message'])
        .map((item) => VisitModel.fromJson(item))
        .toList();
  }
  
  @override
  Future<SubscriptionModel> getSubscription(String id)async {
     final response = await dio.get(
      endPoint: '${ApiConstance.getSubscriptionEndPoint}/$id',
    ) as Response;
    return SubscriptionModel.fromMap(response.data['data']);
  }
}
