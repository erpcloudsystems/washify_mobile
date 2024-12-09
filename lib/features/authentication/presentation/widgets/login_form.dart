import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterTiny(),
          const CustomTextFormField(),
        ],
      ),
    );
  }
}
