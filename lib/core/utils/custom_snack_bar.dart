import 'package:flutter/material.dart';

import '../resources/colors_managers.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    {required BuildContext context,
    required String message,
    Color color = ColorsManager.mainColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        message,
      ),
    ),
  );
}
