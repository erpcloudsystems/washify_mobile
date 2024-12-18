import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/image_paths.dart';
import '../resources/strings_manager.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.errorMessage});
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImagePaths.errorImagePath,
          width: 100.w,
        ),
        const Gutter(),
        Text(
           StringsManager.notData,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
