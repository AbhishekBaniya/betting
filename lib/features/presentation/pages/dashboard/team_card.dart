import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/extensions/responsive_num_extensions.dart';
import '../../../data/model/team_model.dart';
import '../../controller/dashboard/team_controller.dart';

class TeamCard extends StatelessWidget {
  final TeamModel team;
  final TeamController controller = Get.put(TeamController());

  TeamCard({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isFollowing = controller.authController.currentUser?.followingTeams.contains(team.id) ?? false;
      return Card(
        margin: EdgeInsets.all(8),
        child: Container(
          width: 150,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 50.h, width: 50.w, decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(team.logoUrl,),fit: BoxFit.fill,),),),
              SizedBox(height: 10),
              Text(team.name,),
              SizedBox(height: 10),
              Text('Wins: ${team.wins}'),
              Text('Losses: ${team.losses}'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  isFollowing ? controller.unfollowTeam(team.id) : controller.followTeam(team.id);
                },
                child: Text(isFollowing ? 'Unfollow' : 'Follow'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
