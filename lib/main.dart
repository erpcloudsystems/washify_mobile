import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:washify_mobile/core/resources/strings_manager.dart';
import 'package:washify_mobile/core/resources/theme_manager.dart';

import 'core/router/go_router_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: StringsManager.appName,
          theme: AppTheme.getApplicationLightTheme(),
          routerConfig: router,
          builder: FlutterSmartDialog.init(),
        );
      },
    );
  }
}
