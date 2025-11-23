import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/dashboard/team_controller.dart';
class TeamScreen extends StatelessWidget {
  final controller = Get.put(TeamController());

  TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teamId = /*Get.parameters['id']!*/'1';
    final team = controller.authController.currentUser; // For demo
    return Scaffold(
      appBar: AppBar(title: Text('Team Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Team ID: $teamId'),
            Text('Team Name: Demo Team'),
            ElevatedButton(
              onPressed: () {
                if (controller.isFollowing(teamId)) {
                  controller.unfollowTeam(teamId);
                } else {
                  controller.followTeam(teamId);
                }
              },
              child: Obx(() =>
                  Text(controller.isFollowing(teamId) ? 'Unfollow' : 'Follow')),
            )
          ],
        ),
      ),
    );
  }
}
