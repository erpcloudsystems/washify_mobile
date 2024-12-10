import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/global/enums.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_drop_down_widget.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_snack_bar.dart';
import 'package:washify_mobile/features/authentication/presentation/data/models/sign_up_request_model.dart';
import 'package:washify_mobile/features/authentication/presentation/logic/cubit/auth_cubit.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/router/route_services.dart';
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
                  Row(
                    children: [
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (value) {},
                        side: const BorderSide(
                          width: 1,
                        ),
                      ),
                      const Text(StringsManager.rememberMe)
                    ],
                  ),
                  Text(
                    StringsManager.howDidYouFindAboutUs,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const CustomDropDownFormField(
                    dropDownList: ['TEST'],
                    hint: 'Friends & Family',
                  ),
                  const Gutter(),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSignUpSuccessState) {
                        showSnackBar(context: context, message: state.message);
                      } else if (state is AuthSignUpErrorState) {
                        showSnackBar(
                            context: context,
                            message: state.error,
                            color: ColorsManager.red);
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        title: StringsManager.signUp,
                        onPressed: () async {
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
                        },
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
}
