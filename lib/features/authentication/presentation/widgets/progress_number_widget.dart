import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_managers.dart';

class ProgressNumberWidget extends StatelessWidget {
  const ProgressNumberWidget({
    super.key,
    required this.number,
    required this.title,
    required this.isActive,
  });
  final String number;
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? ColorsManager.mainColor : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                4,
              ),
            ),
            border: Border.all(
              color: ColorsManager.mainColor,
            ),
          ),
          child: Text(
            number,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isActive ? Colors.white : ColorsManager.mainColor,
                ),
          ),
        ),
        const GutterTiny(),
        Flexible(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: isActive ? Colors.black : Colors.grey,
            ),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
