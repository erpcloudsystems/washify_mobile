import 'package:flutter/material.dart';

import '../../../../../core/resources/colors_managers.dart';

class SubscriptionContainer extends StatelessWidget {
  const SubscriptionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.mainColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Daily',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
