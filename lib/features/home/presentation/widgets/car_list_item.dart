import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/resources/colors_managers.dart';

class CarListItem extends StatelessWidget {
  const CarListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Card(
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.car,
              color: ColorsManager.mainColor,
              size: 80,
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'Mercedes',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
