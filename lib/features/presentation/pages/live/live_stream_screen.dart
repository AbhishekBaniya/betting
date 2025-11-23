import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../data/model/event_model.dart';
import '../../controller/dashboard/chat_controller.dart';
import '../../controller/dashboard/live_controller.dart';
import '../../widgets/chat_overlay.dart';

class LiveStreamScreen extends StatelessWidget {
  final LiveController liveController = Get.put(LiveController());
  final ChatController chatController = Get.put(ChatController());

  final EventModel dummyEvent = EventModel(
    id: 'event1',
    name: 'Team A vs Team B',
    date: '',
    teamA: 'Team A',
    teamB: 'Team B',
  );

  LiveStreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    liveController.initLiveStream(dummyEvent.id, 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    chatController.fetchMessages(dummyEvent.id);

    return Scaffold(
      appBar: AppBar(title: Text('Live Stream')),
      body: Stack(
        children: [
          Obx(() {
            final controller = liveController.controllers[dummyEvent.id];
            if (controller == null || !controller.value.isInitialized) return Center(child: CircularProgressIndicator());
            return AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            );
          }),
          ChatOverlay(eventId: dummyEvent.id),
        ],
      ),
    );
  }
}