import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:washify_mobile/core/network/exceptions.dart';
import 'package:washify_mobile/features/subscription/data/models/days_week_model.dart';
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

  void resetSubscriptions() {
    for (int i = 0; i < listOfWeekDays.length; i++) {
      if (listOfWeekDays[i].isSelected) {
        listOfWeekDays[i].toggleSelected();
      }
    }
    getSubscriptions();
  }

  // Get Visits
  List<DateTime> visits = [];
  Future<void> getVisits() async {
    emit(GetVisitsLoadingState());
    try {
      final response = await _baseSubscriptionServices.getVisits();
      for (final visit in response) {
        final date = DateTime.tryParse(visit);
        if (date != null) {
          visits.add(date);
        }
      }
      emit(GetVisitsSuccessState());
    } on PrimaryServerException catch (error) {
      emit(GetSubscriptionsErrorState(error.message));
    }
  }
}
