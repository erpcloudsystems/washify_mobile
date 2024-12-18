import 'package:dio/dio.dart';
import 'package:washify_mobile/features/shop/data/models/shop_item_model.dart';

import '../../../../core/global/dependencies_container.dart';
import '../../../../core/network/api_constant.dart';
import '../../../../core/network/dio_helper.dart';

abstract class BaseShopServices {
  Future<List<ShopItemModel>> getShopItems();
}

class ShopServices implements BaseShopServices {
  final dio = sl<BaseDioHelper>();
  @override
  Future<List<ShopItemModel>> getShopItems() async {
    final response = await dio.get(
      endPoint: ApiConstance.getShopItemsEndPoint,
      query: {
        'fields': '["name","item_name","description","image","standard_rate"]',
        'filters' : '[["is_stock_item","=","1"],["is_sales_item","=","1"]]',
      },
    ) as Response;

    return List.from(response.data['data'])
        .map((item) => ShopItemModel.fromMap(item))
        .toList();
  }
}
