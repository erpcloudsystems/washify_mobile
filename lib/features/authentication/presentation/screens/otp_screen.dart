import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:washify_mobile/core/network/exceptions.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_loading_widget.dart';
import 'package:washify_mobile/core/utils/custom_snack_bar.dart';
import 'package:washify_mobile/features/authentication/logic/auth/auth_cubit.dart';
import 'package:washify_mobile/features/authentication/logic/otp/cubit/otp_cubit.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/loading_dialogs.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final countDownController = CountDownController();
  late final OtpCubit otpCubit;

  @override
  void initState() {
    super.initState();
    countDownController.reset();
    otpCubit = context.read<OtpCubit>();
  }

  @override
  void dispose() {
    countDownController.pause();
    super.dispose();
  }

  Future<void> verifyOtp(int otpCode) async {
    await otpCubit.verifyOtp(
      email: widget.email,
      otp: otpCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 80.h,
            ),
            child: BlocConsumer<OtpCubit, OtpState>(
              listener: _verifyListener,
              builder: (context, state) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        StringsManager.verification,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        StringsManager.enterPINcode,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        widget.email,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CircularCountDownTimer(
                        width: 150.w,
                        height: 100.h,
                        duration: 300,
                        fillColor: Theme.of(context).colorScheme.primary,
                        ringColor: Theme.of(context).colorScheme.onPrimary,
                        isReverse: true,
                        isReverseAnimation: true,
                        controller: countDownController,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Pinput(
                        length: 6,
                        onCompleted: (pin) {
                          if (countDownController.getTime() != '0') {
                            verifyOtp(int.tryParse(pin)!);
                          } else {
                            showSnackBar(
                              context: context,
                              message: StringsManager.otpHasBeenExpired,
                              color: ColorsManager.red,
                            );
                          }
                        },
                        autofillHints: const [AutofillHints.oneTimeCode],
                        toolbarEnabled: false,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        StringsManager.didNotReceiveCode,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      if (state is SendOtpLoadingState)
                        const CustomLoadingWidget(),
                      if (state is! SendOtpLoadingState)
                        TextButton(
                          onPressed: () async {
                            print(widget.email);
                            await otpCubit.sendOtp(email: widget.email);
                            countDownController.restart();
                          },
                          child: const Text(
                            StringsManager.resend,
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _verifyListener(BuildContext context, OtpState state) async {
    if (state is VerifyOtpLoadingState) {
      LoadingUtils.showLoadingDialog(context);
    } else if (state is VerifyOtpSuccessState) {
      try {
        await context.read<AuthCubit>().login(
              userName: widget.email,
              password: widget.password,
            );
        context.pop();
        if (mounted) {
          RoutesService.push(
            AppRoutes.locateScreen,
            context: context,
          );
        }
      } on PrimaryServerException catch (e) {
        showSnackBar(
          context: context,
          message: e.message,
          color: ColorsManager.red,
        );
      }
    } else if (state is VerifyOtpFailureState) {
      context.pop();
      showSnackBar(
        context: context,
        message: state.errorMessage,
        color: ColorsManager.red,
      );
    }
  }
}
