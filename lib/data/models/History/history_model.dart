import 'package:vexora_fe/data/models/Music/music_model.dart';

class History {
  final String uuid;
  final DateTime createdAt;
  final String userUuid;
  final String mood;
  final String playlistName;
  final String path;
  final List<Music> musics;

  History({
    required this.uuid,
    required this.createdAt,
    required this.userUuid,
    required this.mood,
    required this.playlistName,
    required this.path,
    required this.musics,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      uuid: json['id'],
      userUuid: json['user_uuid'],
      mood: json['mood'],
      playlistName: json['playlist_name'],
      path: json['path'],
      createdAt: DateTime.parse(json['created_at']),
      musics: List<Music>.from(json['musics'].map((x) => Music.fromJson(x))),
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
      'musics': musics.map((x) => x.toJson()).toList(),
    };
  }
}
