import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:washify_mobile/core/network/exceptions.dart';
import 'package:washify_mobile/features/authentication/presentation/data/services/otp_services.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._baseOtpServices) : super(OtpInitial());
  final BaseOtpServices _baseOtpServices;

  // Send Otp
  Future<void> sendOtp({required String email}) async {
    emit(SendOtpLoadingState());
    try {
      await _baseOtpServices.sendOtp(email);
      emit(SendOtpSuccessState());
    } on PrimaryServerException catch (e) {
      emit(SendOtpFailureState(e.message));
    }
  }

  // Verify Otp
  Future<void> verifyOtp({required int otp, required String email}) async {
    emit(VerifyOtpLoadingState());
    try {
      await _baseOtpServices.verifyOtp(email, otp);
      emit(VerifyOtpSuccessState());
    } on PrimaryServerException catch (e) {
      emit(VerifyOtpFailureState(e.message));
    }
  }
}
