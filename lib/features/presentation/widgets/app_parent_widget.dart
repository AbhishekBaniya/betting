
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesbetting/features/presentation/app_routes/app_navigators.dart';
import 'package:salesbetting/features/presentation/app_routes/app_routes.dart';


import '../../../config/res/assets.dart';
import 'app_text_widget.dart';


class AppParentWidget extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? body, bottomNavigationBar;
  final  Color? screenBgColor;
  final bool? top, bottom, left, right;
  const AppParentWidget({super.key, this.appBar, this.resizeToAvoidBottomInset, this.body, this.bottomNavigationBar, this.screenBgColor, this.top, this.bottom, this.left, this.right});

  @override
  Widget build(BuildContext context) => SafeArea(
      top: top??false,
      bottom: bottom??false,
      left: left??false,
      right: right??false,
      //key: parentKey,
      child: Scaffold(
        backgroundColor: screenBgColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar ??  PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
    
                    /// LEFT SIDE: Logo + Text (Infinite Business Solutions)
                    Image.asset(
                      Assets.logo,
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width/2.5,
                    ),
    
                    /// RIGHT SIDE: Two Circular Icons
                    Row(
                      children: [
                        _circularIcon(Assets.logout,),
                        const SizedBox(width: 12),
                        _circularIcon(Assets.notification,),
                        Icon(
                          Icons.more_vert, size: 32, color: Color(0xFF9E9E9E),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: body,
       /* bottomNavigationBar: bottomNavigationBar ?? SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppRichTextWidget().buildRichText(
                text1: '© 2025 All rights reserved.',
                style1: TextStyle(fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),),
              AppRichTextWidget().buildRichText(
                text1: 'Version 1.0.0 | Privacy Policy | Terms of Service',
                style1: TextStyle(fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),),

            ],
          ),
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', tooltip: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Teams', tooltip: 'Teams'),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'LeaderBoard', tooltip: 'LeaderBoard'),
            BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Live', tooltip: 'Live'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile', tooltip: 'Profile'),
          ],
          onTap: (index) {
            switch (index) {
              case 1:
                AppNavigator().navigateTo(AppRoutes.team,);
                break;
              case 2:
                AppNavigator().navigateTo(AppRoutes.leaderBoard,);
                break;
              case 3:
                AppNavigator().navigateTo(AppRoutes.live,);
                break;
              case 4:
                AppNavigator().navigateTo(AppRoutes.profile,);
                break;
            }
          },
        ),

      ),
  );



  /// Function for reusable circular icon button
  Widget _circularIcon(String iconPath) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF209FA7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          iconPath,
          width: 32,    // ✅ CONTROL IMAGE SIZE HERE
          height: 32,   // ✅ CONTROL IMAGE SIZE HERE
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}







