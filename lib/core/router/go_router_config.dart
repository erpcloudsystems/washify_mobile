import 'package:go_router/go_router.dart';
import 'package:washify_mobile/core/router/app_routes.dart';
import 'package:washify_mobile/features/authentication/presentation/screens/locate_screen.dart';
import 'package:washify_mobile/features/authentication/presentation/screens/login_screen.dart';
import 'package:washify_mobile/features/authentication/presentation/screens/sign_up_screen.dart';
import 'package:washify_mobile/features/authentication/presentation/screens/subscribe_screen.dart';

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
    GoRoute(
      path: AppRoutes.signUpScreen,
      name: AppRoutes.signUpScreen,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: AppRoutes.locateScreen,
      name: AppRoutes.locateScreen,
      builder: (context, state) => const LocateScreen(),
    ),
    GoRoute(
      path: AppRoutes.subscribeScreen,
      name: AppRoutes.subscribeScreen,
      builder: (context, state) => const SubscribeScreen(),
    ),
  ],
);
