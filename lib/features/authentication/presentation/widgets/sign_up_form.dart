import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
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
    );
  }
}
