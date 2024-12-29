import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocal {
  static String path = 'assets/locale';
  static const List<Locale> supportLocals = [
    Locale('en'),
    Locale('ar'),
  ];

  static bool? isEnglish;

  ///switch locals
  static Future<void> toggleBetweenLocales(BuildContext context) async {
    if (isEnglish!) {
      await context.setLocale(supportLocals[0]);
    } else {
      await context.setLocale(supportLocals[1]);
    }
  }

  ///reset device local
  static Locale? fallbackLocal(
    Locale? currentLocal,
    Iterable<Locale> supportLocal,
  ) {
    if (currentLocal != null) {
      for (final Locale locale in supportLocal) {
        if (locale.languageCode == currentLocal.languageCode) {
          return currentLocal;
        }
      }
    }
    return null;
  }
}