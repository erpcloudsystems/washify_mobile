import 'package:flutter/material.dart';

import '../../../../../core/resources/colors_managers.dart';

class CarInfoRecord extends StatelessWidget {
  const CarInfoRecord({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
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
