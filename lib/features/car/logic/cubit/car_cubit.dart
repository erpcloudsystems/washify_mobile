import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:washify_mobile/core/network/exceptions.dart';
import 'package:washify_mobile/features/car/data/models/request_service_model.dart';
import 'package:washify_mobile/features/car/data/services/car_service.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit(this._baseCarServices) : super(CarInitial());
  final BaseCarServices _baseCarServices;

  // Get Brands
  List<String> brands = [];
  Future<void> getBrands() async {
    emit(GetBrandsLoadingState());
    try {
      brands = await _baseCarServices.getBrands();
      emit(GetBrandsSuccessState());
    } on PrimaryServerException catch (e) {
      emit(GetBrandsErrorState(e.message));
    }
  }

  List<RequestServiceModel> requestServiceModels = [];
  double totalPay = 0;
  void addNewService({required RequestServiceModel requestServiceModel}) {
    totalPay += requestServiceModel.price;
    requestServiceModels.add(requestServiceModel);
  }

// Create Request Service
  Future<void> createRequestService() async {
    emit(CreateRequestServiceLoadingState());
    try {
      for (var model in requestServiceModels) {
        await _baseCarServices.createRequestService(model);
      }

      emit(CreateRequestServiceSuccessState());
    } on PrimaryServerException catch (e) {
      emit(CreateRequestServiceErrorState(e.message));
    }
  }

  List<RequestServiceModel> carsList = [];
  Future<void> getCars() async {
    emit(GetCarsLoadingState());
    try {
      carsList = await _baseCarServices.getCars();
      emit(GetCarsSuccessState());
    } on PrimaryServerException catch (e) {
      emit(GetCarsErrorState(e.message));
    } catch (e) {
      emit(GetCarsErrorState(e.toString()));
    }
  }

  void reset() {
    requestServiceModels = [];
    totalPay = 0;
    emit(CarInitial());
  }

  // Create Request Service
  Future<void> updateRequestService() async {
    emit(UpdateRequestServiceLoadingState());
    try {
      await _baseCarServices.updateRequestService(requestServiceModels.first);
      emit(UpdateRequestServiceSuccessState());
    } on PrimaryServerException catch (e) {
      emit(UpdateRequestServiceErrorState(e.message));
    }
  }
}
