import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/colors_managers.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: ColorsManager.mainColor),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Subscription status:'),
              const GutterTiny(),
              Text(
                'Active',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              const Text('Subscription plan:'),
              const GutterTiny(),
              Text(
                'Daily',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              const Text('Starting date:'),
              const GutterTiny(),
              Text(
                '2024-12-09',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              const Text('Ending date:'),
              const GutterTiny(),
              Text(
                '2025-01-09',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              const Text('Payment method:'),
              const GutterTiny(),
              Text(
                'Visa',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              const Text('Number of cars:'),
              const GutterTiny(),
              Text(
                '4',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
