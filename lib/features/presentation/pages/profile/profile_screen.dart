import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/app_auth_controller.dart';
import '../dashboard/achievement_badge.dart';

class ProfileScreen extends StatelessWidget {
  final AppAuthController authController = Get.put(AppAuthController());

  @override
  Widget build(BuildContext context) {
    final user = authController.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: user == null
          ? Center(child: Text('Not logged in'))
          : Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            if (user.badges.isNotEmpty) ...[
              SizedBox(height: 20),
              Text('Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                children: user.badges.map((b) => AchievementBadge(title: b, icon: Icons.star)).toList(),
              ),
            ],
            CircleAvatar(radius: 50, child: Text(user.name[0])),
            SizedBox(height: 20),
            Text(user.name, style: TextStyle(fontSize: 24)),
            Text(user.email),
            SizedBox(height: 20),
            Text('Credits: ${user.credits}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => authController.signOut(), child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}