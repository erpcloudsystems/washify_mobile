import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';

import '../resources/colors_managers.dart';
import '../resources/image_paths.dart';
import '../resources/strings_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        useImmersiveMode: false,
        duration: const Duration(seconds: 7),
        onEnd: () => RoutesService.pushReplacementNamed(
          context: context,
          location: AppRoutes.loginScreen,
        ),
        backgroundColor: Colors.white,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              ImagePaths.loadingLottiePath,
              width: 250.w,
            ),
            const Gutter.extraLarge(),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  StringsManager.erpCloudSystems,
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 30),
                  colors: [
                    ColorsManager.mainColor,
                    ColorsManager.secondaryColor,
                  ],
                ),
              ],
              totalRepeatCount: 4,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
          ],
        ),
      ),
    );
  }
}
