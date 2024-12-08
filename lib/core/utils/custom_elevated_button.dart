import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global/enums.dart';
import '../resources/colors_managers.dart';
import 'custom_loading_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.elevatedButtonStyle = CustomElevatedButtonStyle.primary,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
  });
  final CustomElevatedButtonStyle elevatedButtonStyle;
  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 55.h),
          backgroundColor:
              elevatedButtonStyle == CustomElevatedButtonStyle.primary
                  ? ColorsManager.mainColor
                  : ColorsManager.white,
          foregroundColor:
              elevatedButtonStyle == CustomElevatedButtonStyle.primary
                  ? ColorsManager.white
                  : ColorsManager.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: ColorsManager.mainColor,
              width: .7,
            ),
            borderRadius: BorderRadius.circular(
              22.r,
            ),
          ),
        ),
        child: isLoading
            ? const CustomLoadingWidget()
            : Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
