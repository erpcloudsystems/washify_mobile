import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors_managers.dart';

class CustomElevatedIconButton extends StatelessWidget {
  const CustomElevatedIconButton({
    super.key,
    required this.title,
    required this.iconData,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 11.sp,
        ),
        maxLines: 1,
      ),
      icon: Icon(
        iconData,
        size: 16,
        color: Colors.black,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: Size(double.infinity, 32.h),
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
