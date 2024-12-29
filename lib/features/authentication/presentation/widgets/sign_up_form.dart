import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/utils/custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.phoneController});
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  CustomTextFormField(
                    controller: firstNameController,
                  ),
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
                  CustomTextFormField(
                    controller: lastNameController,
                  ),
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
            CustomTextFormField(
              controller: emailController,
              isEmail: true,
            ),
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
            CustomTextFormField(
              controller: phoneController,
            ),
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
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
            ),
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
            CustomTextFormField(
              controller: confirmPasswordController,
              isPassword: true,
              isConfirmPassword: true,
              newPassword: passwordController.text,
            ),
          ],
        ),
      ],
    );
  }
}
