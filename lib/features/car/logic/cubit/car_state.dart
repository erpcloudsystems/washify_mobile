part of 'car_cubit.dart';

sealed class CarState extends Equatable {
  const CarState();

  @override
  List<Object> get props => [];
}

final class CarInitial extends CarState {}

// Get Brands State
class GetBrandsLoadingState extends CarState {}

class GetBrandsErrorState extends CarState {
  final String errorMessage;
  const GetBrandsErrorState(this.errorMessage);
}

class GetBrandsSuccessState extends CarState {}
