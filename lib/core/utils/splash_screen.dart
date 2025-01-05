import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:washify_mobile/core/resources/constance.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/core/router/route_services.dart';

import '../global/dependencies_container.dart';
import '../resources/image_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final bool _isLoggedIn;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isLoggedIn = sl<SharedPreferences>().getBool(isLoggedInKey) ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.scale(
        useImmersiveMode: false,
        duration: const Duration(seconds: 7),
        onEnd: () => _isLoggedIn
            ? RoutesService.go(
                context: context, location: AppRoutes.layoutScreen)
            : RoutesService.pushReplacementNamed(
                context: context,
                location: AppRoutes.loginScreen,
              ),
        backgroundColor: Colors.white,
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagePaths.splashLogoPath,
              width: 250.w,
            ),
          ],
        ),
      ),
    );
  }
}
