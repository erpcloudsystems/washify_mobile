part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginSussesState extends AuthState {}

final class AuthLoginErrorState extends AuthState {
  final String errorMessage;

  const AuthLoginErrorState({required this.errorMessage});
}

final class AuthSignUpLoadingState extends AuthState {}

final class AuthSignUpSuccessState extends AuthState {
  final String message;

  const AuthSignUpSuccessState({this.message = StringsManager.pleaseCheckYourEmail});
}

final class AuthSignUpErrorState extends AuthState {
  final String error;

  const AuthSignUpErrorState({required this.error});
}

final class AuthPickLogoImageSuccessState extends AuthState {}

final class AuthEmptyLogoImageState extends AuthState {}

final class AuthTerritoryLoadingState extends AuthState {}

final class AuthGovernorateSuccessState extends AuthState {}

final class AuthGovernorateErrorState extends AuthState {
  final String error;

  const AuthGovernorateErrorState({required this.error});
}

// Get Referral Source
final class AuthGetReferralSourceLoadingState extends AuthState {}

final class AuthGetReferralSourceSuccessState extends AuthState {
  final List<String> referralList;
  const AuthGetReferralSourceSuccessState({required this.referralList});
}

final class AuthGetReferralSourceErrorState extends AuthState {
  final String error;

  const AuthGetReferralSourceErrorState({required this.error});
}
