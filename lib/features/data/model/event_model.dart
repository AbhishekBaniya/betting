class EventModel {
  String id;
  String name;
  String date;
  String teamA;
  String teamB;

  EventModel({
    required this.id,
    required this.name,
    required this.date,
    required this.teamA,
    required this.teamB,
  });

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      teamA: map['teamA'],
      teamB: map['teamB'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date,
      'teamA': teamA,
      'teamB': teamB,
    };
  }
}
