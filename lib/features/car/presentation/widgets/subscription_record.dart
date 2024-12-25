import 'package:flutter/material.dart';

import '../../../../core/resources/colors_managers.dart';

class SubscriptionRecord extends StatelessWidget {
  const SubscriptionRecord(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
      ],
    );
  }
}
