import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesService {
  static Future push(
    String location, {
    required BuildContext context,
    Object? extra,
  }) {
    return context.push(location, extra: extra);
  }

  /// Named route is used only with query parameters
  static Future pushNamed(
    String name, {
    required BuildContext context,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return context.pushNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void pushReplacement({
    required BuildContext context,
    required String location,
    Object? extra,
  }) {
    context.pushReplacement(
      location,
      extra: extra,
    );
  }

  /// Named route is used only with query parameters
  static void pushReplacementNamed({
    required BuildContext context,
    required String location,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.pushReplacementNamed(
      location,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Pops all routes currently in the stack
  /// then goes to the new route (example: logout)
  static void go({
    required BuildContext context,
    required String location,
    Object? extra,
  }) {
    context.go(
      location,
      extra: extra,
    );
  }

  /// Pops all routes currently in the stack
  /// then goes to the new route (example: logout)
  static void goNamed(
    String name, {
    required BuildContext context,
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    context.goNamed(
      name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}