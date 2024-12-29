import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/features/car/data/models/request_service_model.dart';

import '../../../../core/resources/colors_managers.dart';

class CarListItem extends StatelessWidget {
  const CarListItem({super.key, required this.car});
  final RequestServiceModel car;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => RoutesService.pushNamed(
        AppRoutes.subscriptionScreen,
        context: context,
        extra: car,
      ),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.mainColor.withOpacity(
                0.1,
              ),
              blurRadius: 12,
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.car,
                    color: ColorsManager.mainColor,
                  ),
                  const GutterSmall(),
                  Text(
                    car.brand,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorsManager.mainColor,
                        ),
                  ),
                ],
              ),
              Text(
                'Model: ${car.model}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
              Text(
                'PNo. ${car.plateCode}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor,
                    ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  thickness: 0.4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    car.subscriptionPlan,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorsManager.mainColor.withOpacity(0.7)),
                  ),
                ],
              ),
              Text(
                '${car.timesPerWeek}/week',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ColorsManager.mainColor.withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
