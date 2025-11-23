import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesbetting/features/presentation/app_routes/app_routes.dart';

class OnboardingView extends StatelessWidget {

  OnboardingView({super.key});

  final List<String> steps = [
    "Welcome to Sales Bets",
    "Place bets on your favorite teams",
    "Win rewards but never lose credits",
    "Follow teams & watch live streams",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sports_esports, size: 100, color: Colors.deepPurple),
              SizedBox(height: 50),
              Text(steps[index], style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
              SizedBox(height: 50),
              if (index == steps.length - 1)
                ElevatedButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.login),
                  child: Text("Get Started"),
                ),
            ],
          );
        },
      ),
    );
  }
}
