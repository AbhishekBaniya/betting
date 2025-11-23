import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:salesbetting/core/utils/services/firebase_service.dart';
import 'package:salesbetting/features/data/model/event_model.dart';
import 'package:uuid/uuid.dart';

import 'config/res/strings.dart';
import 'core/utils/bool_manager.dart';
import 'core/utils/constants.dart';
import 'core/utils/services/responsive_service.dart';
import 'features/data/data_source/local_data_source/hive_manager.dart';
import 'features/presentation/app_routes/app_navigation_tracer.dart';
import 'features/presentation/app_routes/app_navigators.dart';
import 'features/presentation/app_routes/app_pages.dart';
import 'features/presentation/app_routes/app_routes.dart';
import 'features/presentation/bindings/app_binding.dart';
import 'features/presentation/controller/theme/theme_controller.dart';
import 'features/presentation/pages/authentication/signup_view.dart';
import 'features/presentation/pages/dashboard/dashboard_screen.dart';
import 'features/presentation/pages/leader_board/leaderboard_screen.dart';
import 'features/presentation/pages/live/live_stream_screen.dart';
import 'features/presentation/pages/profile/profile_screen.dart';
import 'features/presentation/pages/onboarding/onboarding_view.dart';
import 'features/presentation/pages/users_screen.dart';


import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppBindings().dependencies();
  await GetStorage.init();
  BoolManager().setBool(Consts.debugBanner, false);
  // Initialize Hive and the box
  await HiveManager().initHive();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(MyApp()));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // For Android production, use AndroidProvider.playIntegrity()
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug, // for Android debug/emulator
    appleProvider: AppleProvider.appAttest, // for iOS
  );

    /*final teams = [
      {
        "id": "event1",
        "name": "Falcons vs Tigers",
        "teamA": "team1",
        "teamB": "team2",
        "date": "2025-11-25T18:00:00Z"
      }
    ];

    for (var t in teams) {
      //await FirebaseFirestore.instance.collection('messages').doc('${t['id']}').set(t);

    }*/


  //await FirebaseService().createEvent(EventModel(id: const Uuid().v4(), name: 'Falcons vs Tigers', date: '2025-11-25 18:00', teamA: 'team1', teamB: 'team2'));

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  final controller = Get.put(ThemeController());


  @override
  Widget build(BuildContext context) {
    // Wrap with Builder to get a proper context after MaterialApp
    return Builder(
      builder: (context) {
        // Initialize SizeService here
        SizeService.instance.init(context);
          return GetMaterialApp(
            debugShowCheckedModeBanner: BoolManager().getBool(Consts.debugBanner),
            initialBinding: AppBindings(),
            darkTheme: controller.darkTheme,
            theme: controller.lightTheme,
            themeMode: ThemeMode.dark,
            enableLog: true,
            useInheritedMediaQuery: true,
            smartManagement: SmartManagement.full,
            showPerformanceOverlay: false,
            textDirection: TextDirection.ltr,
            defaultGlobalState: true,
            transitionDuration: Duration.zero,
            popGesture: true,
            opaqueRoute: false,
            getPages: AppPages.pages,
            navigatorKey: AppNavigator().navigatorKey,
            navigatorObservers: [NavigationTracer()],
            title: Strings.appName,
            initialRoute: AppRoutes.home,
            home: OnboardingView(),
          );

      },
    );
  }
}
