import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../config/res/theme.dart';
import '../../../../core/utils/services/theme_service.dart';

class ThemeController extends GetxController {
  final currentTheme = ThemeMode.system.obs;

  ThemeData get lightTheme => AppThemes.oceanLight;
  ThemeData get darkTheme => AppThemes.oceanDark;

  void changeTheme(ThemeMode mode) {
    currentTheme.value = mode;
    ThemeService().saveMode(mode);
  }

  ThemeMode loadTheme() {
    currentTheme.value = ThemeService().loadMode();
    return currentTheme.value;
  }
}
