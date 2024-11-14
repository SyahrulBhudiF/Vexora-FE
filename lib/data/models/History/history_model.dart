class History {
  final String uuid;
  final DateTime createdAt;
  final String userUuid;
  final String mood;
  final String playlistName;
  final String path;

  History({
    required this.uuid,
    required this.createdAt,
    required this.userUuid,
    required this.mood,
    required this.playlistName,
    required this.path,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      uuid: json['uuid'],
      createdAt: DateTime.parse(json['created_at']),
      userUuid: json['user_uuid'],
      mood: json['mood'],
      playlistName: json['playlist_name'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'created_at': createdAt.toIso8601String(),
      'user_uuid': userUuid,
      'mood': mood,
      'playlist_name': playlistName,
      'path': path,
    };
  }
}
