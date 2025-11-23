import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_navigation_tracer.dart';

class AppNavigator {
  // Singleton pattern for easy access
  static final AppNavigator _instance = AppNavigator._internal();

  factory AppNavigator() => _instance;

  AppNavigator._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigate to a specific page
  void navigateTo(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
    NavigationTracer().logRouteChange(Get.currentRoute, Get.previousRoute);
  }

  /// Navigate to a page and replace the current one
  void navigateToAndReplace(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
    NavigationTracer().logRouteChange(Get.currentRoute, Get.previousRoute);
  }

  /// Navigate to a page and remove all previous routes
  void navigateToAndRemoveAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
    NavigationTracer().logRouteChange(Get.currentRoute, Get.previousRoute);
  }

  /// Go back to the previous screen
  void goBack({required bool isBack}) {
    switch (isBack) {
      case true:
        Get.back();
        //NavigationTracer().logRouteChange(Get.currentRoute, Get.previousRoute);
        break;
      case false:
      // Handle if no previous screen exists
        Get.snackbar('Error', 'No screens to pop!');
        break;
      default:
        log(' invalid entry');
    }
  }

  /// Go back and pass result to the previous screen
  void goBackWithResult(dynamic result) {
    Get.back(result: result);
    NavigationTracer().logRouteChange(Get.currentRoute, Get.previousRoute);
  }
}
