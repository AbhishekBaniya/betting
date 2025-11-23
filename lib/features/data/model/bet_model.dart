class BetModel {
  String id;
  String userId;
  String teamId;
  int amount;
  bool won;

  BetModel({
    required this.id,
    required this.userId,
    required this.teamId,
    required this.amount,
    this.won = false,
  });

  factory BetModel.fromMap(Map<String, dynamic> map) {
    return BetModel(
      id: map['id'],
      userId: map['userId'],
      teamId: map['teamId'],
      amount: map['amount'],
      won: map['won'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'teamId': teamId,
      'amount': amount,
      'won': won,
    };
  }
}
