import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/utils/custom_elevated_button.dart';
import 'subscription_container.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key, required this.onPresses});
  final VoidCallback onPresses;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringsManager.services,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const GutterTiny(),
        Text(
          StringsManager.chooseYourMonthlySubscription,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.grey,
              ),
        ),
        const Gutter(),
        const Divider(),
        const Gutter(),
        SizedBox(
          height: 450.h,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 32,
              crossAxisSpacing: 32,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return const SubscriptionContainer();
            },
          ),
        ),
        const Gutter(),
        CustomElevatedButton(
          title: StringsManager.next,
          onPressed: onPresses,
        ),
      ],
    );
  }
}
