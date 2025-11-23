

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/services/auth_service.dart';
import '../../../../core/utils/services/firebase_service.dart';
import '../../../data/model/event_model.dart';
import '../../../data/model/team_model.dart';

class DashboardController extends GetxController {

  final FirebaseService _firebaseService = FirebaseService();

  RxList<EventModel> events = <EventModel>[].obs;
  RxList<TeamModel> trendingTeams = <TeamModel>[].obs;




  @override
  void onInit() {
    super.onInit();
    fetchEvents();
    fetchTrendingTeams();
    Logger().info("ProfileController OnInit() Called");
  }

  @override
  void onReady() {
    super.onReady();
    Logger().info("ProfileController onReady() Called");
  }

  @override
  void onClose() {
    super.onClose();
    Logger().info("ProfileController onClose() Called");
  }

  void fetchEvents() async {
    final list = await _firebaseService.getEvents();
    events.assignAll(list);
    print(list);
    print(events);
  }

  void fetchTrendingTeams() async {
    final list = await _firebaseService.getTeams();
    trendingTeams.assignAll(list.take(5).toList()); // Top 5 trending
    print(list);
    print(trendingTeams);
  }

/*void fetchData() async {
  isLoading.value = true;
  final teamsSnap = await FirebaseFirestore.instance.collection('teams').get();
  final eventsSnap = await FirebaseFirestore.instance.collection('events').get();
  teams.value = teamsSnap.docs.map((e) => Team.fromFirestore(e)).toList();
  events.value = eventsSnap.docs.map((e) => EventModel.fromFirestore(e)).toList();
  isLoading.value = false;
}

void placeBet(String teamId, int credits) async {
  final user = AuthService().currentUser;
  if (user == null) return;
  await FirebaseFirestore.instance.collection('bets').add({
    'userId': user.uid,
    'teamId': teamId,
    'credits': credits,
    'timestamp': FieldValue.serverTimestamp(),
    'status': 'pending',
  });
  Get.snackbar('Bet Placed', 'Your no-loss bet has been placed!');
}*/
}
