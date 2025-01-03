import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';

import 'progress_number_widget.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    this.isLocateActive = false,
    this.isCarInfoActive = false,
    this.isPayNow = false,
  });
  final bool isLocateActive;
  final bool isCarInfoActive;
  final bool isPayNow;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 375.w,
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: ProgressNumberWidget(
                number: '1',
                title: StringsManager.signUp,
                isActive: true,
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DottedLine(
                  dashLength: 2,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: ProgressNumberWidget(
                number: '2',
                title: StringsManager.locate,
                isActive: isLocateActive,
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DottedLine(
                  dashLength: 2,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ProgressNumberWidget(
                  number: '3',
                  title: StringsManager.carInfo,
                  isActive: isCarInfoActive,
                ),
              ),
            ),
            const Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: DottedLine(
                  dashLength: 2,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ProgressNumberWidget(
                  number: '4',
                  title: StringsManager.payNow,
                  isActive: isPayNow,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
