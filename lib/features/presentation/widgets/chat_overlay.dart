import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/message_model.dart';
import '../controller/dashboard/chat_controller.dart';

class ChatOverlay extends StatelessWidget {
  final String eventId;
  final ChatController controller = Get.find();
  final TextEditingController textController = TextEditingController();

  ChatOverlay({required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final msg = controller.messages[index];
                return Text("${msg.senderId}: ${msg.content}", style: TextStyle(color: Colors.white));
              },
            )),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(hintText: 'Message', hintStyle: TextStyle(color: Colors.white54)),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: () {
                    if (textController.text.isEmpty) return;
                    final message = MessageModel(
                      id: DateTime.now().toIso8601String(),
                      senderId: 'You',
                      content: textController.text,
                      timestamp: DateTime.now(),
                    );
                    controller.sendMessage(eventId, message);
                    textController.clear();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
