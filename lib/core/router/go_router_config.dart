import 'package:go_router/go_router.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/features/authentication/login_screen.dart';

import '../utils/splash_screen.dart';

final router = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.loginScreen,
      name: AppRoutes.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
