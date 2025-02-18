import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/global/dependencies_container.dart';
import '../../../../core/network/exceptions.dart';
import '../../../../core/resources/constance.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../data/models/login_request_model.dart';
import '../../data/models/login_response_model.dart';
import '../../data/models/sign_up_request_model.dart';
import '../../data/models/territory_model.dart';
import '../../data/services/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._authRepository,
  ) : super(AuthInitial());
  final AuthRepository _authRepository;
  UserModel? userModel;
  List<TerritoryModel> territories = [];
  String? selectedGovernorate;

  Future<void> caching() async {
    await sl<SharedPreferences>().setBool(isLoggedInKey, true);
    if (userModel != null) {
      await sl<SharedPreferences>().setString(sid, userModel!.sid!);
      await sl<SharedPreferences>().setString(userName, userModel!.username!);
      await sl<SharedPreferences>()
          .setString(systemUser, userModel!.systemUser!);
      await sl<SharedPreferences>().setString(userId, userModel!.userId!);
    }
  }

  Future<void> login(
      {required String userName, required String password}) async {
    emit(AuthLoginLoadingState());
    try {
      userModel = await _authRepository.login(
          loginRequestModel:
              LoginRequestModel(userName: userName, password: password));
      await caching();
      emit(AuthLoginSussesState());
    } on PrimaryServerException catch (error) {
      emit(
        AuthLoginErrorState(errorMessage: error.message),
      );
    } catch (error) {
      emit(
        AuthLoginErrorState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> getTerritory() async {
    emit(AuthTerritoryLoadingState());
    try {
      territories = await _authRepository.getTerritories();
      emit(AuthTerritorySuccessState());
    } on PrimaryServerException catch (error) {
      emit(AuthTerritoryErrorState(
        error: error.message,
      ));
    }
  }

  Future<void> signUp({
    required SignUpRequestModel signUpModel,
  }) async {
    emit(AuthSignUpLoadingState());
    try {
      await _authRepository.signUp(
        signUpRequestModel: signUpModel,
      );

      emit(
          AuthSignUpSuccessState(message: StringsManager.pleaseCheckYourEmail));
      // await login(
      //     userName: signUpModel.email!, password: signUpModel.password!);
    } on PrimaryServerException catch (error) {
      log(error.message);
      emit(AuthSignUpErrorState(error: error.message));
    } catch (error) {
      emit(
        AuthSignUpErrorState(
          error: error.toString(),
        ),
      );
    }
  }

  // Get Referral Source
  List<String> referralSource = [];
  Future<void> getReferralSource() async {
    emit(AuthGetReferralSourceLoadingState());
    try {
      referralSource = await _authRepository.getReferralSource();
      emit(AuthGetReferralSourceSuccessState(referralList: referralSource));
    } on PrimaryServerException catch (error) {
      emit(AuthGetReferralSourceErrorState(error: error.message));
    }
  }
}
