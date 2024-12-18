part of 'shop_cubit.dart';

sealed class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => [];
}

final class ShopInitial extends ShopState {}

final class ShopLoadingState extends ShopState {}

final class ShopSuccessState extends ShopState {}

final class ShopErrorState extends ShopState {
  final String errorMessage;

  const ShopErrorState(this.errorMessage);
}
