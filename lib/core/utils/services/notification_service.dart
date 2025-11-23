import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    await _messaging.requestPermission();
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        Get.snackbar(
          message.notification!.title ?? 'Notification',
          message.notification!.body ?? '',
        );
      }
    });
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }
}
