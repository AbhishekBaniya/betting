class MessageModel {
  String id;
  String senderId;
  String content;
  DateTime timestamp;

  MessageModel({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
  });

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      senderId: map['senderId'],
      content: map['content'],
      timestamp: map['timestamp'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'content': content,
      'timestamp': timestamp,
    };
  }
}
