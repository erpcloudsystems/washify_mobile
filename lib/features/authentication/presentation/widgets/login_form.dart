import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {super.key,
      required this.userController,
      required this.passwordController});
  final TextEditingController userController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.emailAddress,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const GutterTiny(),
        CustomTextFormField(
          controller: userController,
        ),
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.mainColor,
                  ),
            ),
          ],
        ),
        const GutterTiny(),
        CustomTextFormField(
          controller: passwordController,
        ),
      ],
    );
  }
}
