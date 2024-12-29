import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/features/authentication/logic/auth/auth_cubit.dart';
import '../../../../core/utils/custom_snack_bar.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController(text: 'Administrator');
  final passwordController = TextEditingController(text: 'admin');
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 22),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      ImagePaths.splashLogoPath,
                      width: 200,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const GutterLarge(),
                  Text(
                    StringsManager.login,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const GutterSmall(),
                  Text(
                    StringsManager.loginDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  const GutterLarge(),
                  LoginForm(
                    userController: userController,
                    passwordController: passwordController,
                  ),
                  const Gutter(),
                  Row(
                    children: [
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (value) {},
                        side: const BorderSide(
                          width: 1,
                        ),
                      ),
                      Text(StringsManager.keepMeSignedIn),
                    ],
                  ),
                  const GutterSmall(),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: _loginListener,
                    builder: (context, state) {
                      return CustomElevatedButton(
                        title: StringsManager.kContinue,
                        onPressed: _login,
                        isLoading: state is AuthLoginLoadingState,
                      );
                    },
                  ),
                  const GutterLarge(),
                  /* const OrSignUpWithDivider(),
                  const GutterSmall(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: SignUpWithSocialWidget(),
                  ),*/
                  //const GutterLarge(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        StringsManager.doNotHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const GutterTiny(),
                      InkWell(
                        onTap: () => RoutesService.pushReplacementNamed(
                          context: context,
                          location: AppRoutes.signUpScreen,
                        ),
                        child: Text(
                          StringsManager.signUpHere,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: ColorsManager.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
            userName: userController.text.trim(),
            password: passwordController.text.trim(),
          );
    }
  }

  void _loginListener(context, state) {
    if (state is AuthLoginSussesState) {
      showSnackBar(
        context: context,
        message: StringsManager.loginSuccessfully,
      );

      RoutesService.go(context: context, location: AppRoutes.homeScreen);
    } else if (state is AuthLoginErrorState) {
      showSnackBar(
        context: context,
        message: state.errorMessage,
        color: ColorsManager.red,
      );
    }
  }
}
