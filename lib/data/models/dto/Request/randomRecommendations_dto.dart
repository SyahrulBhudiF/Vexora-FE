class PlaylistDto {
  final String id;
  final String playlistName;
  final String artist;
  final String path;
  final String thumbnail;

  PlaylistDto({
    required this.id,
    required this.playlistName,
    required this.artist,
    required this.path,
    required this.thumbnail,
  });

  // Menambahkan fromJson untuk parsing JSON menjadi objek PlaylistDto
  factory PlaylistDto.fromJson(Map<String, dynamic> json) {
    return PlaylistDto(
      id: json['id'],
      playlistName: json['playlist_name'],
      artist: json['artist'],
      path: json['path'],
      thumbnail: json['thumbnail'],
    );
  }

  // Untuk serialisasi objek PlaylistDto ke Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'playlist_name': playlistName,
      'artist': artist,
      'path': path,
      'thumbnail': thumbnail,
    };
  }
}
