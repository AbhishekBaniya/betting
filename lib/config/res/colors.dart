import 'package:flutter/material.dart';

class ColorManager {
  // Step 1: Private static instance variable
  static final ColorManager _instance = ColorManager._internal();

  // Step 2: Private named constructor
  ColorManager._internal();

  // Step 3: Public factory constructor to return the same instance every time
  factory ColorManager() {
    return _instance;
  }

  /// Red Ruby (Dark)
  static const Color redPrimary = Color(0xFFFF1744);
  static const Color onRedPrimary = Color(0xFF290005);

  static const Color redAccent = Color(0xFFFF5252);
  static const Color onRedAccent = Color(0xFF2A0000);

  static const Color redPrimaryDark = Color(0xFFD0002B);
  static const Color onRedPrimaryDark = Color(0xFFFFE6EB);

  static const Color redBackgroundDark = Color(0xFF200006);
  static const Color onRedBackgroundDark = Color(0xFFFFEEF2);

  static const Color redSurfaceDark = Color(0xFF2A0009);
  static const Color onRedSurfaceDark = Color(0xFFFFE4EB);

  static const Color redInputFillDark = Color(0xFF35000F);

  /// Purple Glow (Dark)
  static const Color purplePrimary = Color(0xFF9C27B0);
  static const Color onPurplePrimary = Color(0xFF120013);

  static const Color purpleAccent = Color(0xFFE040FB);
  static const Color onPurpleAccent = Color(0xFF240024);

  static const Color purplePrimaryDark = Color(0xFF7C1E8C);
  static const Color onPurplePrimaryDark = Color(0xFFF9E6FF);

  static const Color purpleBackgroundDark = Color(0xFF15061A);
  static const Color onPurpleBackgroundDark = Color(0xFFF8E8FF);

  static const Color purpleSurfaceDark = Color(0xFF1E0C25);
  static const Color onPurpleSurfaceDark = Color(0xFFEFD4FF);

  static const Color purpleInputFillDark = Color(0xFF2A1135);


  ///Ocean Theme
  static const Color secondary = Color(0xFF042027);
  static const Color secondaryDark = Color(0xFF0891B2);
  static const Color onSecondaryDark = Color(0xFFE8F8FB);

  static const Color background = Color(0xFFF8FAFF);
  static const Color onBackground = Color(0xFF051427);
  static const Color backgroundDark = Color(0xFF071025);
  static const Color onBackgroundDark = Color(0xFFEAF6FF);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF051427);
  static const Color surfaceDark = Color(0xFF071225);
  static const Color onSurfaceDark = Color(0xFFDFF6FF);

  static const Color inputFill = Color(0xFFF0F6FF);
  static const Color inputFillDark = Color(0xFF061223);

  static const Color error = Color(0xFFDC2626);
  static const Color onError = Color(0xFFFFFFFF);

  ///Ocean Theme

  /// Sunset Palette
  static const Color primarySunset = Color(0xFFFB923C);
  static const Color onPrimarySunset = Color(0xFF2A0B00);
  static const Color primaryDarkSunset = Color(0xFFF97316);
  static const Color onPrimaryDarkSunset = Color(0xFF2A0B00);

  static const Color secondarySunset = Color(0xFFF472B6);
  static const Color onSecondarySunset = Color(0xFF2A0B0F);
  static const Color secondaryDarkSunset = Color(0xFFFB7185);
  static const Color onSecondaryDarkSunset = Color(0xFFFFFFFF);

  static const Color backgroundSunset = Color(0xFFFFFBF6);
  static const Color onBackgroundSunset = Color(0xFF2A1208);
  static const Color backgroundDarkSunset = Color(0xFF141014);
  static const Color onBackgroundDarkSunset = Color(0xFFFFF7F0);

  static const Color surfaceSunset = Color(0xFFFFFFFF);
  static const Color onSurfaceSunset = Color(0xFF2A140A);
  static const Color surfaceDarkSunset = Color(0xFF14100E);
  static const Color onSurfaceDarkSunset = Color(0xFFFFF2E8);

  static const Color inputFillSunset = Color(0xFFFFF1E6);
  static const Color inputFillDarkSunset = Color(0xFF1A0F0D);

  static const Color errorSunset = Color(0xFFB91C1C);
  static const Color onErrorSunset = Color(0xFFFFFFFF);

/// Forest Palette
  static const Color primaryForest = Color(0xFF10B981);
  static const Color onPrimaryForest = Color(0xFFFFFFFF);
  static const Color primaryDarkForest = Color(0xFF34D399);
  static const Color onPrimaryDarkForest = Color(0xFF012115);

  static const Color secondaryForest = Color(0xFF84CC16);
  static const Color onSecondaryForest = Color(0xFF0E1B0A);
  static const Color secondaryDarkForest = Color(0xFF7DD3A6);
  static const Color onSecondaryDarkForest = Color(0xFF022010);

  static const Color backgroundForest = Color(0xFFF6FFF9);
  static const Color onBackgroundForest = Color(0xFF05120A);
  static const Color backgroundDarkForest = Color(0xFF07120D);
  static const Color onBackgroundDarkForest = Color(0xFFEFFCF5);

  static const Color surfaceForest = Color(0xFFFFFFFF);
  static const Color onSurfaceForest = Color(0xFF03120A);
  static const Color surfaceDarkForest = Color(0xFF071210);
  static const Color onSurfaceDarkForest = Color(0xFFDFF7EE);

  static const Color inputFillForest = Color(0xFFF2FFF6);
  static const Color inputFillDarkForest = Color(0xFF071210);

  static const Color errorForest = Color(0xFFDC2626);
  static const Color onErrorForest = Color(0xFFFFFFFF);



  static const Color darkError = Color(0xFFFF5B5B);
  static const Color darkOnError = Color(0xFFFFFFFF);

  static const Color darkBaseBackground = Color(0xFF0A0A0E);
  static const Color darkOnBaseBackground = Color(0xFFE5E5EA);

}