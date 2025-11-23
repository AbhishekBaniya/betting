class TeamModel {
  String id;
  String name;
  String logoUrl;
  int wins;
  int losses;

  TeamModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    this.wins = 0,
    this.losses = 0,
  });

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id'],
      name: map['name'],
      logoUrl: map['logoUrl'],
      wins: map['wins'] ?? 0,
      losses: map['losses'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'wins': wins,
      'losses': losses,
    };
  }
}
