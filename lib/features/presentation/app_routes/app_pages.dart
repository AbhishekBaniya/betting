import 'package:get/get.dart';
import 'package:salesbetting/features/presentation/pages/authentication/login_view.dart';
import 'package:salesbetting/features/presentation/pages/authentication/signup_view.dart';
import 'package:salesbetting/features/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:salesbetting/features/presentation/pages/onboarding/onboarding_view.dart';

import '../bindings/app_binding.dart';
import '../pages/leader_board/leaderboard_screen.dart';
import '../pages/live/live_stream_screen.dart';
import '../pages/profile/profile_screen.dart';
import '../pages/team/teams_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      title: AppRoutes.onBoarding,
      name: AppRoutes.onBoarding,
      transition: Transition.circularReveal,
      page: () => OnboardingView(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.login,
      name: AppRoutes.login,
      transition: Transition.circularReveal,
      page: () => LoginView(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.signUp,
      name: AppRoutes.signUp,
      transition: Transition.circularReveal,
      page: () => SignupView(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.dashboard,
      name: AppRoutes.dashboard,
      transition: Transition.circularReveal,
      page: () => DashboardScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.team,
      name: AppRoutes.team,
      transition: Transition.circularReveal,
      page: () => TeamScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.live,
      name: AppRoutes.live,
      transition: Transition.circularReveal,
      page: () => LiveStreamScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.profile,
      name: AppRoutes.profile,
      transition: Transition.circularReveal,
      page: () => ProfileScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
    GetPage(
      title: AppRoutes.leaderBoard,
      name: AppRoutes.leaderBoard,
      transition: Transition.circularReveal,
      page: () => LeaderboardScreen(),
      binding: AppBindings(),
      preventDuplicates: true,
      popGesture: true,
      maintainState: true,
    ),
  ];

  ///Future Implementation
  //static final unknownRoute = GetPage(name: AppRoutes.unknown, page: () => NotFoundPage());
}

///auth_middleware.dart
/*class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuthenticated = false; // Add your logic here
    return !isAuthenticated ? RouteSettings(name: route*//*AppRoutes.login*//*) : null;
  }
}*/
