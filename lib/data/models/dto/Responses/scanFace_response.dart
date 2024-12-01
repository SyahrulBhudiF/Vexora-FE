class Data {
  String detectedMood;
  List<Track> recommendedTracks;
  String playlistId;

  Data({
    required this.detectedMood,
    required this.recommendedTracks,
    required this.playlistId,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      detectedMood: json['detected_mood'] ?? 'Unknown',
      recommendedTracks: json['music'] != null
          ? List<Track>.from(json['music'].map((v) => Track.fromJson(v)))
          : [],
      playlistId: json['playlist_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'detected_mood': detectedMood,
      'recommendedTracks': recommendedTracks.map((v) => v.toJson()).toList(),
      'playlist_id': playlistId,
    };
  }
}

class Track {
  String id;
  String name;
  String artist;
  String path;
  String thumbnail;

  Track({
    required this.id,
    required this.name,
    required this.artist,
    required this.path,
    required this.thumbnail,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      name: json['playlist_name'],
      artist: json['artist'],
      path: json['path'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playlist_name': name,
      'artist': artist,
      'path': path,
      'thumbnail': thumbnail,
    };
  }
}
