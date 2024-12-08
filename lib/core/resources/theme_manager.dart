import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_managers.dart';
import 'fonts_manager.dart';

abstract class AppTheme {
  static ThemeData getApplicationLightTheme() => ThemeData(
        useMaterial3: true,
        fontFamily: FontsName.headlinesFont,
        // Swatch color
        colorSchemeSeed: ColorsManager.mainColor,

        scaffoldBackgroundColor: ColorsManager.scaffoldBackGroundColor,

        // AppBar
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: ColorsManager.mainColor,
            size: 22.sp,
          ),
          centerTitle: false,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20.sp,
            color: ColorsManager.mainColor,
            fontWeight: FontWeight.w700,
          ),
        ),

        //Card theme
        cardTheme: CardTheme(
          color: ColorsManager.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // Text Themes
        textTheme: TextTheme(
          // Headlines text
          headlineLarge:
              TextStyle(fontSize: 38.sp, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
          headlineSmall:
              TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),

          // Title text
          titleLarge: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
          titleSmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w400),

          // Details text
          bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
          bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
          bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
          // Label text
          labelLarge: TextStyle(fontSize: 16.sp),
          labelMedium: TextStyle(fontSize: 14.sp),
          labelSmall: TextStyle(fontSize: 12.sp),
        ),

        // Icons
        iconTheme: IconThemeData(
          size: 22.sp,
          color: ColorsManager.grey,
        ),

        // Checkbox
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(
            style: BorderStyle.solid,
            color: ColorsManager.mainColor,
            width: 5.w,
          ),
        ),

        // Buttons
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 18.sp,
              color: ColorsManager.black,
            ),
          ),
        ),

        // Dialogs
        dialogTheme: DialogTheme(
          backgroundColor: ColorsManager.white,
          titleTextStyle: TextStyle(
            fontSize: 12.sp,
          ),
        ),

        // List tile
        listTileTheme: ListTileThemeData(
          tileColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          enableFeedback: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
