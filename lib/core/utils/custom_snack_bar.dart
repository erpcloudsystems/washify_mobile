import 'package:flutter/material.dart';

import '../resources/colors_managers.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    {required BuildContext context, required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.mainColor,
      content: Text(
        message,
      ),
    ),
  );
}
