class UserModel {
  String uid;
  String name;
  String email;
  int credits;
  List<String> followingTeams;
  List<String> badges; // New property

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.credits = 100,
    this.followingTeams = const [],
    this.badges = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'credits': credits,
      'followingTeams': followingTeams,
      'badges': badges,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      credits: map['credits'] ?? 100,
      followingTeams: List<String>.from(map['followingTeams'] ?? []),
      badges: List<String>.from(map['badges'] ?? []),
    );
  }
}
