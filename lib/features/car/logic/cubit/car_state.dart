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

class UpdateRequestServiceLoadingState extends CarState {}

class UpdateRequestServiceErrorState extends CarState {
  final String errorMessage;
  const UpdateRequestServiceErrorState(this.errorMessage);
}

class UpdateRequestServiceSuccessState extends CarState {}

class GetCarsLoadingState extends CarState {}

class GetCarsSuccessState extends CarState {}

class GetCarsErrorState extends CarState {
  final String errorMessage;
  const GetCarsErrorState(this.errorMessage);
}

// get models by brand
class GetCarsModelByBrandLoadingState extends CarState {}

class GetCarsModelByBrandSuccessState extends CarState {}

class GetCarsModelByBrandErrorState extends CarState {
  final String errorMessage;
  const GetCarsModelByBrandErrorState(this.errorMessage);
}

// Delete Request Service
class DeleteRequestServiceLoadingState extends CarState {}

class DeleteRequestServiceSuccessState extends CarState {}

class DeleteRequestServiceErrorState extends CarState {
  final String errorMessage;
  const DeleteRequestServiceErrorState(this.errorMessage);
}
