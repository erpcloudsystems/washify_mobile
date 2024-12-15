import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:washify_mobile/core/network/exceptions.dart';
import 'package:washify_mobile/features/subscription/data/models/subscription_model.dart';
import 'package:washify_mobile/features/subscription/data/services/subscription_services.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit(this._baseSubscriptionServices)
      : super(SubscriptionInitial());
  final BaseSubscriptionServices _baseSubscriptionServices;

  // Get Subscription
  List<SubscriptionModel> subscriptions = [];
  Future<void> getSubscriptions() async {
    emit(GetSubscriptionsLoadingState());
    try {
      subscriptions = await _baseSubscriptionServices.getSubscriptions();
      emit(GetSubscriptionsSuccessState());
    } on PrimaryServerException catch (error) {
      emit(GetSubscriptionsErrorState(error.message));
    }
  }
}
