class History {
  final String uuid;
  final String user_id;
  final String mood;
  final DateTime createdAt;

  History({
    required this.uuid,
    required this.user_id,
    required this.createdAt,
    required this.mood,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      uuid: json['uuid'],
      user_id: json['user_uuid'],
      mood: json['mood'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'user_uuid': user_id,
      'mood': mood,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
