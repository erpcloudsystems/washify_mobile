import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import 'car_info_form.dart';
import 'car_info_record.dart';

class CarInfoWidget extends StatelessWidget {
  const CarInfoWidget({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.carInfo,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
        const GutterTiny(),
        Text(
          StringsManager.addYourCar,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.grey,
              ),
        ),
        const Gutter(),
        const Divider(),
        const Gutter(),
        const CarInfoForm(),
        const Gutter(),
        const Divider(),
        const Gutter(),
        const CarInfoRecord(
          title: StringsManager.fees,
          value: '12.13\$',
        ),
        const Gutter(),
        const CarInfoRecord(
          title: StringsManager.discount,
          value: '-0\$',
        ),
        const GutterSmall(),
        const Divider(),
        const GutterSmall(),
        const CarInfoRecord(
          title: StringsManager.toPay,
          value: '12.13\$',
        ),
        const GutterLarge(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: CustomElevatedButton(
            title: StringsManager.addCar,
            onPressed: () {},
          ),
        ),
        const GutterLarge(),
        CustomElevatedButton(
          title: StringsManager.checkOut,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
