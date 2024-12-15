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



}
