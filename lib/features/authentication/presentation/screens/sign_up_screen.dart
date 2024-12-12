import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/global/enums.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_drop_down_widget.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_snack_bar.dart';
import 'package:washify_mobile/features/authentication/presentation/logic/auth/auth_cubit.dart';
import 'package:washify_mobile/features/authentication/presentation/logic/otp/cubit/otp_cubit.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/router/route_services.dart';
import '../data/models/sign_up_request_model.dart';
import '../widgets/or_sign_up_with_divider.dart';
import '../widgets/progress_bar_widget.dart';
import '../widgets/sign_up_form.dart';
import '../widgets/sign_up_with_social_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    final authCubit = context.read<AuthCubit>();
    authCubit.getReferralSource();

    super.initState();
  }

  void clearController() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProgressBarWidget(),
                  const Gutter(),
                  Text(
                    StringsManager.signUp,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GutterSmall(),
                  Text(
                    StringsManager.signUpDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: ColorsManager.grey,
                        ),
                  ),
                  const GutterSmall(),
                  const SignUpWithSocialWidget(
                    style: SignUpWithSocialWidgetStyle.signUp,
                  ),
                  const GutterSmall(),
                  const OrSignUpWithDivider(),
                  const GutterSmall(),
                  SignUpForm(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    phoneController: phoneController,
                  ),
                  const Gutter(),
                  BlocConsumer<AuthCubit, AuthState>(
                    listenWhen: (previous, current) => previous != current,
                    listener: (context, state) {
                      if (state is AuthSignUpSuccessState) {
                        if (mounted) {
                          context
                              .read<OtpCubit>()
                              .sendOtp(email: emailController.text.trim());
                        }
                        showSnackBar(context: context, message: state.message);
                        RoutesService.pushNamed(
                          AppRoutes.otpScreen,
                          context: context,
                          queryParameters: {
                            'email': emailController.text.trim(),
                            'password': passwordController.text.trim(),
                          },
                        );
                        clearController();
                      } else if (state is AuthSignUpErrorState) {
                        showSnackBar(
                            context: context,
                            message: state.error,
                            color: ColorsManager.red);
                      }
                    },
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      final referralSource =
                          context.read<AuthCubit>().referralSource;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.howDidYouFindAboutUs,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          CustomDropDownFormField(
                            dropDownList: referralSource,
                            hint: 'Friends & Family',
                            isValidate: false,
                          ),
                          const Gutter(),
                          CustomElevatedButton(
                            isLoading: state is AuthSignUpLoadingState,
                            title: StringsManager.signUp,
                            onPressed: _signUp,
                          ),
                        ],
                      );
                    },
                  ),
                  const Gutter(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.alreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const GutterTiny(),
                      InkWell(
                        onTap: () => RoutesService.pushReplacementNamed(
                          context: context,
                          location: AppRoutes.loginScreen,
                        ),
                        child: Text(
                          StringsManager.loginHere,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorsManager.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      await context.read<AuthCubit>().signUp(
              signUpModel: SignUpRequestModel(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
            phoneNumber: phoneController.text,
          ));
    }
  }
}
