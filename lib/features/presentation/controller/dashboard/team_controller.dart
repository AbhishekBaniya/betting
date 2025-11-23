import 'package:get/get.dart';

import '../../../../core/utils/services/firebase_service.dart';
import '../../../data/model/team_model.dart';
import '../auth/app_auth_controller.dart';

/*class TeamController extends GetxController {
  final FirebaseService firebaseService = FirebaseService();
  final AppAuthController authController = Get.find();

  RxList<TeamModel> teams = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  void fetchTeams() async {
    final list = await firebaseService.getTeams();
    teams.assignAll(list);
  }


  void unfollowTeam(String teamId) async {
    final user = authController.currentUser;
    if (user != null && user.followingTeams.contains(teamId)) {
      user.followingTeams.remove(teamId);
      await firebaseService.cloudsFirestore.collection('users').doc(user.uid).update({
        'followingTeams': user.followingTeams,
      });
      authController.user.refresh();
    }
  }

  void followTeam(String teamId) async {
    final user = authController.currentUser;
    if (user != null && !user.followingTeams.contains(teamId)) {
      user.followingTeams.add(teamId);

      // Award badge
      if (!user.badges.contains('Team Follower')) {
        user.badges.add('Team Follower');
      }

      await firebaseService.cloudsFirestore.collection('users').doc(user.uid).update({
        'followingTeams': user.followingTeams,
        'badges': user.badges,
      });
      authController.user.refresh();
    }
  }
}*/
class TeamController extends GetxController {
  final FirebaseService firebaseService = FirebaseService();
  final AppAuthController authController = Get.put(AppAuthController());

  RxList<TeamModel> teams = <TeamModel>[].obs;

  @override
  void onInit() {
    fetchTeams();
    super.onInit();
  }

  void fetchTeams() async {
    final list = await firebaseService.getTeams();
    teams.assignAll(list);
  }

  // Check if current user is following a team
  bool isFollowing(String teamId) {
    final user = authController.currentUser;
    return user?.followingTeams.contains(teamId) ?? false;
  }

  void unfollowTeam(String teamId) async {
    final user = authController.currentUser;
    if (user != null && user.followingTeams.contains(teamId)) {
      user.followingTeams.remove(teamId);
      await firebaseService.cloudFirestore.collection('users').doc(user.uid).update({
        'followingTeams': user.followingTeams,
      });
      authController.user.refresh();
    }
  }

  void followTeam(String teamId) async {
    final user = authController.currentUser;
    if (user != null && !user.followingTeams.contains(teamId)) {
      user.followingTeams.add(teamId);

      // Award badge
      if (!user.badges.contains('Team Follower')) {
        user.badges.add('Team Follower');
      }

      await firebaseService.cloudFirestore.collection('users').doc(user.uid).update({
        'followingTeams': user.followingTeams,
        'badges': user.badges,
      });
      authController.user.refresh();
    }
  }
}
