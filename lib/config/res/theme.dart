import 'package:flutter/material.dart';

import '../../core/utils/extensions/app_theme_extension.dart';
import '../../core/utils/extensions/responsive_num_extensions.dart';
import 'colors.dart';

class AppThemes {
  /// 🌊 Ocean Theme - Light
  static ThemeData oceanLight = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      primary: ColorManager.secondaryDark,
      secondary: ColorManager.secondaryDark,
      surface: ColorManager.surface,
      background: ColorManager.background,
      error: ColorManager.error,
      onError: ColorManager.onError,
    ),
    checkboxTheme: checkboxTheme(light),
    radioTheme: radioTheme(light),
    inputDecorationTheme: inputTheme(light),
    filledButtonTheme: filledButtonTheme(light),
    appBarTheme: appBarTheme(light),
    bottomNavigationBarTheme: bottomNav(light),
    bottomSheetTheme: bottomSheetTheme(light),
    cardTheme:CardThemeData( elevation: 3,
      color: ColorManager.surface,
      margin: EdgeInsets.all(8.w), // responsive margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r), // responsive radius
      ),),
    chipTheme: chipTheme(light),
    dividerTheme: dividerTheme(light),
    snackBarTheme: bannerTheme(light),
    extensions: [light],
  );

  /// 🌊 Ocean Theme - Dark
  static ThemeData oceanDark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: ColorManager.secondaryDark,
      secondary: ColorManager.secondaryDark,
      surface: ColorManager.surfaceDark,
      background: ColorManager.backgroundDark,
      error: ColorManager.error,
      onError: ColorManager.onError,
    ),

    checkboxTheme: checkboxTheme(dark),
    radioTheme: radioTheme(dark),
    inputDecorationTheme: inputTheme(dark),
    filledButtonTheme: filledButtonTheme(dark),
    appBarTheme: appBarTheme(dark),
    bottomNavigationBarTheme: bottomNav(dark),
    bottomSheetTheme: bottomSheetTheme(dark),
    cardTheme:CardThemeData( elevation: 3,
      color: ColorManager.surfaceDark,
      margin: EdgeInsets.all(8.w), // responsive margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r), // responsive radius
      ),),
    chipTheme: chipTheme(dark),
    dividerTheme: dividerTheme(dark),
    snackBarTheme: bannerTheme(dark),
    extensions: [dark],
  );


  static CheckboxThemeData checkboxTheme(AppThemeColors c) =>
      CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        fillColor: MaterialStateProperty.resolveWith(
              (states) => states.contains(MaterialState.selected)
              ? c.primary
              : c.onSurface.withOpacity(.4),
        ),
        checkColor: MaterialStateProperty.all(c.onPrimary),
      );

  static RadioThemeData radioTheme(AppThemeColors c) => RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
          ? c.primary
          : c.onSurface.withOpacity(.4),
    ),
  );

  static InputDecorationTheme inputTheme(AppThemeColors c) =>
      InputDecorationTheme(
        filled: true,
        fillColor: c.inputFill,
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 18.w),
        errorStyle: TextStyle(fontSize: 12.sp, color: c.error),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: c.onSurface.withOpacity(.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: c.onSurface.withOpacity(.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: c.primary, width: 1.4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: c.error, width: 1.4),
        ),
      );

  static FilledButtonThemeData filledButtonTheme(AppThemeColors c) =>
      FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.primary,
          disabledBackgroundColor: c.onSurface.withOpacity(.2),
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: c.onPrimary,
          ),
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );

  static AppBarTheme appBarTheme(AppThemeColors c) => AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: c.background,
    titleTextStyle: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: c.onBackground,
    ),
    iconTheme: IconThemeData(color: c.onBackground, size: 22.sp),
  );

  static BottomNavigationBarThemeData bottomNav(AppThemeColors c) =>
      BottomNavigationBarThemeData(
        backgroundColor: c.surface,
        selectedItemColor: c.primary,
        unselectedItemColor: c.onSurface.withOpacity(.6),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      );

  static BottomSheetThemeData bottomSheetTheme(AppThemeColors c) =>
      BottomSheetThemeData(
        backgroundColor: c.surface,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(22.r)),
        ),
      );

  static CardTheme cardTheme(AppThemeColors c) => CardTheme(
    elevation: 3,
    color: c.surface,
    margin: EdgeInsets.all(8.w),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
  );

  static ChipThemeData chipTheme(AppThemeColors c) => ChipThemeData(
    backgroundColor: c.surface,
    disabledColor: c.onSurface.withOpacity(.12),
    selectedColor: c.primary,
    secondarySelectedColor: c.primary.withOpacity(.85),

    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
    elevation: 0,
    pressElevation: 0,
    shadowColor: Colors.transparent,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
      side: BorderSide(
        color: c.onSurface.withOpacity(.15),
        width: 1,
      ),
    ),

    labelStyle: TextStyle(
      fontSize: 14.sp,
      color: c.onSurface,
      fontWeight: FontWeight.w500,
    ),

    secondaryLabelStyle: TextStyle(
      fontSize: 14.sp,
      color: c.onPrimary,
      fontWeight: FontWeight.w600,
    ),

    brightness: Brightness.light, // will auto adapt in dark theme override
  );


  static DividerThemeData dividerTheme(AppThemeColors c) =>
      DividerThemeData(color: c.onSurface.withOpacity(.2), space: 1.h);

  static BadgeThemeData badgeTheme(AppThemeColors c) => BadgeThemeData(
    backgroundColor: c.error,
    textColor: c.onError,
    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
    /*shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
    ),*/
  );

  static SnackBarThemeData bannerTheme(AppThemeColors c) =>
      SnackBarThemeData(
        backgroundColor: c.primary,
        contentTextStyle: TextStyle(fontSize: 14.sp, color: c.onPrimary),
      );
}



final light = AppThemeColors(
  primary: ColorManager.secondaryDark,
  onPrimary: ColorManager.onSecondaryDark,
  secondary: ColorManager.secondary,
  onSecondary: ColorManager.onSurface,
  background: ColorManager.background,
  onBackground: ColorManager.onBackground,
  surface: ColorManager.surface,
  onSurface: ColorManager.onSurface,
  inputFill: ColorManager.inputFill,
  error: ColorManager.error,
  onError: ColorManager.onError,
);

final dark = AppThemeColors(
  primary: ColorManager.secondaryDark,
  onPrimary: ColorManager.onSecondaryDark,
  secondary: ColorManager.secondary,
  onSecondary: ColorManager.onSurfaceDark,
  background: ColorManager.backgroundDark,
  onBackground: ColorManager.onBackgroundDark,
  surface: ColorManager.surfaceDark,
  onSurface: ColorManager.onSurfaceDark,
  inputFill: ColorManager.inputFillDark,
  error: ColorManager.error,
  onError: ColorManager.onError,
);
