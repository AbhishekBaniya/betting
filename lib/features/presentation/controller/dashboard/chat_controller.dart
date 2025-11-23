import 'package:get/get.dart';
import '../../../../core/utils/services/firebase_service.dart';
import '../../../data/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  final FirebaseService _firebaseService = FirebaseService();
  RxList<MessageModel> messages = <MessageModel>[].obs;

  void fetchMessages(String eventId) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(eventId)
        .collection('messages')
        .orderBy('timestamp')
        .snapshots()
        .listen((snapshot) {
      messages.value = snapshot.docs.map((e) => MessageModel.fromMap(e.data())).toList();
    });
  }

  void sendMessage(String eventId, MessageModel msg) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(eventId)
        .collection('messages')
        .add(msg.toMap());
  }
}
