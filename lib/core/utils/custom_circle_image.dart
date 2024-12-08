import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCircleImage extends StatelessWidget {
  const CustomCircleImage(
      {super.key, required this.imagePath, this.radius, this.isLocal = false});
  final String imagePath;
  final bool isLocal;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: isLocal
          ? FileImage(File(imagePath))
          : NetworkImage(
              imagePath,
            ),
      onBackgroundImageError: (exception, stackTrace) {
        const Icon(FontAwesomeIcons.fileImage);
      },
      radius: radius ?? 40.r,
    );
  }
}
