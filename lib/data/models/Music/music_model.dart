class Music {
  final String uuid;
  final DateTime createdAt;
  final String historyUuid;
  final String id;
  final String musicName;
  final String path;
  final String thumbnail;
  final String artist;

  Music({
    required this.uuid,
    required this.createdAt,
    required this.id,
    required this.historyUuid,
    required this.musicName,
    required this.path,
    required this.thumbnail,
    required this.artist,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      uuid: json['uuid'],
      historyUuid: json['history_id'],
      id: json['id'],
      musicName: json['music_name'],
      path: json['path'],
      thumbnail: json['thumbnail'],
      artist: json['artist'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'created_at': createdAt.toIso8601String(),
      'id': id,
      'history_uuid': historyUuid,
      'music_name': musicName,
      'path': path,
      'thumbnail': thumbnail,
      'artist': artist,
    };
  }
}
