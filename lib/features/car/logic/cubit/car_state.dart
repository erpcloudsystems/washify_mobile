// ignore_for_file: public_member_api_docs, sort_constructors_first
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

// Create Request service state
class CreateRequestServiceLoadingState extends CarState {}

class CreateRequestServiceErrorState extends CarState {
  final String errorMessage;
  const CreateRequestServiceErrorState(this.errorMessage);
}

class CreateRequestServiceSuccessState extends CarState {}

class GetCarsLoadingState extends CarState {}

class GetCarsSuccessState extends CarState {}

class GetCarsErrorState extends CarState {
  final String errorMessage;
  const GetCarsErrorState(this.errorMessage);
}
