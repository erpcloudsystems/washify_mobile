import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:washify_mobile/core/resources/image_paths.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import '../../../../core/global/enums.dart';
import '../../../../core/utils/custom_elevated_icon_button.dart';

class SignUpWithSocialWidget extends StatelessWidget {
  const SignUpWithSocialWidget({
    super.key,
    this.style = SignUpWithSocialWidgetStyle.login,
  });

  final SignUpWithSocialWidgetStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomElevatedIconButton(
            title: style == SignUpWithSocialWidgetStyle.login
                ? StringsManager.google
                : StringsManager.signUpWithGoogle,
            icon: Image.asset(
              ImagePaths.googlePath,
              width: 18.w,
            ),
          ),
        ),
        const GutterSmall(),
        Flexible(
          child: CustomElevatedIconButton(
            title: style == SignUpWithSocialWidgetStyle.login
                ? StringsManager.facebook
                : StringsManager.signUpWithFacebook,
            icon: Image.asset(
              ImagePaths.facebookPath,
              width: 18.w,
            ),
          ),
        ),
      ],
    );
  }
}
