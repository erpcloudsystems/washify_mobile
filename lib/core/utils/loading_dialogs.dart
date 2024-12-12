import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../resources/colors_managers.dart';

abstract class LoadingUtils {
  /// If you will use "Linear Loading", you must give a message in the parameters.
  static showLoadingDialog(BuildContext context, [String? message]) =>
      showDialog(
        barrierDismissible: false,
        barrierColor: Colors.grey.withOpacity(0.4),
        context: context,
        builder: (BuildContext context) => Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: ColorsManager.white,
          insetPadding: const EdgeInsets.all(12),
          child: WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                height: 150,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulseRise,
                  colors: [
                    ColorsManager.mainColor,
                    ColorsManager.secondaryColor,
                  ],
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ),
      );
}
