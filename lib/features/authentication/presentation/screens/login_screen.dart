import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_text_form_field.dart';

import '../widgets/or_sign_up_with_divider.dart';
import '../widgets/sign_up_with_social_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  ImagePaths.logoPngPath,
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
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.emailAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const GutterTiny(),
                      const CustomTextFormField(),
                      const GutterLarge(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringsManager.password,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            StringsManager.forgotPassword,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: ColorsManager.mainColor,
                                ),
                          ),
                        ],
                      ),
                      const GutterTiny(),
                      const CustomTextFormField(),
                    ],
                  ),
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
                    const Text(StringsManager.keepMeSignedIn),
                  ],
                ),
                const GutterSmall(),
                CustomElevatedButton(
                  title: StringsManager.kContinue,
                  onPressed: () {},
                ),
                const GutterLarge(),
                const OrSignUpWithDivider(),
                const GutterSmall(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: SignUpWithSocialWidget(),
                ),
                const GutterLarge(),
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
    );
  }
}
