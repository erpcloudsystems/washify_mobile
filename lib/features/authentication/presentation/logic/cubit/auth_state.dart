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

  const AuthSignUpSuccessState({required this.message});
}

final class AuthSignUpErrorState extends AuthState {
  final String error;

  const AuthSignUpErrorState({required this.error});
}

final class AuthPickLogoImageSuccessState extends AuthState {}

final class AuthEmptyLogoImageState extends AuthState {}

final class AuthGovernorateLoadingState extends AuthState{}

final class AuthGovernorateSuccessState extends AuthState{}

final class AuthGovernorateErrorState extends AuthState{
  final String error;

  const AuthGovernorateErrorState({required this.error});
}
