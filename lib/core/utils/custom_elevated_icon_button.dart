import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton(
      {super.key,
      required this.title,
      this.iconData,
      this.icon,
      this.textStyle,
      this.size,
      this.onPressed});
  final String title;
  final IconData? iconData;
  final Widget? icon;
  final TextStyle? textStyle;
  final Size? size;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        title,
        style: textStyle ??
            TextStyle(
              color: Colors.black,
              fontSize: 11.sp,
            ),
        maxLines: 1,
      ),
      icon: iconData != null
          ? Icon(
              iconData,
              size: 16,
              color: Colors.black,
            )
          : icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: size ?? Size(double.infinity, 32.h),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: ColorsManager.grey,
            width: .7,
          ),
          borderRadius: BorderRadius.circular(
            4.r,
          ),
        ),
      ),
    );
  }
}
