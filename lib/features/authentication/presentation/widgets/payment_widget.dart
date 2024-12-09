import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';
import 'package:washify_mobile/core/utils/custom_elevated_button.dart';
import 'package:washify_mobile/features/authentication/presentation/widgets/payment_method_widget.dart';

import '../../../../core/resources/colors_managers.dart';
import '../../../../core/resources/strings_manager.dart';
import 'car_info_record.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManager.payWith,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorsManager.mainColor,
              ),
        ),
        const GutterTiny(),
        const Gutter(),
        const Divider(),
        const GutterSmall(),
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
        const PaymentMethodWidget(
          imagePath: ImagePaths.instapayPath,
        ),
        const PaymentMethodWidget(
          imagePath: ImagePaths.fawryPath,
        ),
        const PaymentMethodWidget(
          imagePath: ImagePaths.visaPath,
        ),
        const PaymentMethodWidget(
          imagePath: ImagePaths.cashPath,
        ),
        const Gutter(),
        const Divider(),
        const Gutter(),
        CustomElevatedButton(
          title: StringsManager.payNow,
          onPressed: () {
            RoutesService.pushReplacementNamed(
              context: context,
              location: AppRoutes.visitsScreen,
            );
          },
        ),
      ],
    );
  }
}
