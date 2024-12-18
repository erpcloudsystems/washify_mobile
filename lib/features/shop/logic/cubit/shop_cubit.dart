import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:washify_mobile/features/shop/data/models/shop_item_model.dart';
import 'package:washify_mobile/features/shop/data/services/shop_services.dart';

import '../../../../core/network/exceptions.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this._baseShopServices) : super(ShopInitial());
  final BaseShopServices _baseShopServices;
  List<ShopItemModel> shopItems = [];
  Future<void> getShopItems() async {
    emit(ShopLoadingState());
    try {
      shopItems = await _baseShopServices.getShopItems();
      emit(ShopSuccessState());
    } on PrimaryServerException catch (error) {
      emit(ShopErrorState(error.message));
    }
  }
}
