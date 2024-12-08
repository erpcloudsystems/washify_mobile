import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/global/enums.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/utils/custom_drop_down_widget.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/core/utils/custom_text_form_field.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/router/route_services.dart';
import '../widgets/or_sign_up_with_divider.dart';
import '../widgets/progress_bar_widget.dart';
import '../widgets/sign_up_with_social_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
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
                Form(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsManager.firstName,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const GutterTiny(),
                                const CustomTextFormField(),
                              ],
                            ),
                          ),
                          const Gutter(),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsManager.lastName,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const GutterTiny(),
                                const CustomTextFormField(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gutter(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.emailAddress,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const GutterTiny(),
                          const CustomTextFormField(),
                        ],
                      ),
                      const Gutter(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.phone,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const GutterTiny(),
                          const CustomTextFormField(),
                        ],
                      ),
                      const Gutter(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.createPassword,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const GutterTiny(),
                          const CustomTextFormField(),
                        ],
                      ),
                      const Gutter(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            StringsManager.confirmPassword,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const GutterTiny(),
                          const CustomTextFormField(),
                        ],
                      ),
                    ],
                  ),
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
                  dropDownList: [],
                  hint: 'Friends & Family',
                ),
                const Gutter(),
                CustomElevatedButton(
                  title: StringsManager.signUp,
                  onPressed: () {
                    RoutesService.pushNamed(
                      AppRoutes.locateScreen,
                      context: context,
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
    );
  }
}
