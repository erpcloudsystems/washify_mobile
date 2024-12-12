part of 'otp_cubit.dart';

sealed class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object> get props => [];
}

final class OtpInitial extends OtpState {}

// Request opt
class SendOtpLoadingState extends OtpState {}

class SendOtpSuccessState extends OtpState {}

class SendOtpFailureState extends OtpState {
  final String errorMessage;
  const SendOtpFailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}

// Verify Otp
class VerifyOtpLoadingState extends OtpState {}

class VerifyOtpSuccessState extends OtpState {}

class VerifyOtpFailureState extends OtpState {
  final String errorMessage;
  const VerifyOtpFailureState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}