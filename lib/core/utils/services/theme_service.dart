import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'themeMode';

  void saveMode(ThemeMode mode) {
    _box.write(_key, mode.index);
  }

  ThemeMode loadMode() {
    int? index = _box.read(_key);
    return ThemeMode.values[index ?? ThemeMode.system.index];
  }
}
