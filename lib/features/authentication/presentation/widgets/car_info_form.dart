import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_text_form_field.dart';

class CarInfoForm extends StatelessWidget {
  const CarInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.carBrand,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.mainColor,
                ),
          ),
          const GutterTiny(),
          const CustomTextFormField(),
          const GutterLarge(),
          Text(
            StringsManager.carModel,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.mainColor,
                ),
          ),
          const GutterTiny(),
          const CustomTextFormField(),
          const GutterLarge(),
          Text(
            StringsManager.plateNo,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: ColorsManager.mainColor,
                ),
          ),
          const GutterTiny(),
          const CustomTextFormField(),
        ],
      ),
    );
  }
}
