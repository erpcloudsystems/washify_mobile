import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            iconData: FontAwesomeIcons.google,
          ),
        ),
        const GutterSmall(),
        Flexible(
          child: CustomElevatedIconButton(
            title: style == SignUpWithSocialWidgetStyle.login
                ? StringsManager.facebook
                : StringsManager.signUpWithFacebook,
            iconData: Icons.facebook,
          ),
        ),
      ],
    );
  }
}
