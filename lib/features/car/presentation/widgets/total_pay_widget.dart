import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

import '../../../../core/resources/strings_manager.dart';
import 'car_info_record.dart';

class TotalPayWidget extends StatelessWidget {
  const TotalPayWidget({super.key, required this.totalPay});
  final double totalPay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Divider(),
        ),
        CarInfoRecord(
          title: StringsManager.fees,
          value: '$totalPay EGP',
        ),
        const Gutter(),
        CarInfoRecord(
          title: StringsManager.discount,
          value: '-0 EGP',
        ),
        const GutterSmall(),
        const Divider(),
        const GutterSmall(),
        CarInfoRecord(
          title: StringsManager.toPay,
          value: '$totalPay EGP',
        ),
      ],
    );
  }
}
