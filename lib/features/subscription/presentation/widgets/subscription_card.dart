import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/features/car/data/models/request_service_model.dart';
import 'package:washify_mobile/features/subscription/data/models/subscription_model.dart';

import '../../../../core/resources/colors_managers.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard(
      {super.key, required this.subscription, required this.car});
  final SubscriptionModel subscription;
  final RequestServiceModel car;

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
              Text('${StringsManager.subscriptionStatus}: '),
              const GutterTiny(),
              Text(
                StringsManager.active,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              Text('${StringsManager.startingDate}: '),
              const GutterTiny(),
              Text(
                car.startDate!,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(children: [
            Text('${StringsManager.endingDate}: '),
            const GutterTiny(),
            Text(
              car.endDate!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.mainColor,
                  ),
            ),
          ]),
          const GutterSmall(),
          Row(
            children: [
              Text('${StringsManager.subscriptionPlan}: '),
              const GutterTiny(),
              Text(
                subscription.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              Text('${StringsManager.planDetails}: '),
              const GutterTiny(),
              Flexible(
                child: Text(
                  subscription.description,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.mainColor,
                      ),
                ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              Text('${StringsManager.price}: '),
              const GutterTiny(),
              Text(
                '${subscription.price.toString()} ${subscription.currency}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              Text('${StringsManager.determination}: '),
              const GutterTiny(),
              Text(
                subscription.priceDetermination,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
            ],
          ),
          const GutterSmall(),
          Row(
            children: [
              Text('${StringsManager.timesPerWeek}: '),
              const GutterTiny(),
              Text(
                subscription.timesPerWeek.toString(),
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
