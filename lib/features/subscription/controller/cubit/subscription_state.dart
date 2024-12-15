part of 'subscription_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

// Get Subscriptions
class GetSubscriptionsLoadingState extends SubscriptionState {}

class GetSubscriptionsErrorState extends SubscriptionState {
  final String errorMessage;
  const GetSubscriptionsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

class GetSubscriptionsSuccessState extends SubscriptionState {}
