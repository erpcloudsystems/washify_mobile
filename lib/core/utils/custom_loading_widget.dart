import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:washify_mobile/core/resources/colors_managers.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key, this.color = Colors.white});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 44.h,
        child: const LoadingIndicator(
          indicatorType: Indicator.ballRotateChase,
          colors: [ColorsManager.mainColor, ColorsManager.secondaryColor],
          strokeWidth: 1,
        ),
      ),
    );
  }
}
