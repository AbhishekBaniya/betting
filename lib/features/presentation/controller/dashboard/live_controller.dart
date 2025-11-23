import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/utils/services/firebase_service.dart';
import '../../../data/model/event_model.dart';

/*class LiveController extends GetxController {
  final FirebaseService firebaseService = FirebaseService();

  RxList<EventModel> liveEvents = <EventModel>[].obs;
  RxMap<String, VideoPlayerController> controllers = <String, VideoPlayerController>{}.obs;

  void initLiveStream(String eventId, String url) {
    if (!controllers.containsKey(eventId)) {
      final controller =  VideoPlayerController.networkUrl(Uri.parse(url))
        ..initialize().then((_) {
          controller.play();
          controllers[eventId] = controller;
          update();
        });
    }
  }

  void disposeLiveStream(String eventId) {
    controllers[eventId]?.dispose();
    controllers.remove(eventId);
  }
}*/

class LiveController extends GetxController {
  final FirebaseService firebaseService = FirebaseService();

  RxList<EventModel> liveEvents = <EventModel>[].obs;
  RxMap<String, VideoPlayerController> controllers = <String, VideoPlayerController>{}.obs;

  void initLiveStream(String eventId, String url) {
    if (!controllers.containsKey(eventId)) {
      // Step 1: Create the controller
      final VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(url));

      // Step 2: Initialize
      controller.initialize().then((_) {
        // Step 3: Play and add to map after initialization
        controller.play();
        controllers[eventId] = controller;
        update();
      });
    }
  }

  void disposeLiveStream(String eventId) {
    controllers[eventId]?.dispose();
    controllers.remove(eventId);
  }
}
