class User {
  final String uuid;
  final DateTime createdAt;
  final String username;
  final String name;
  final String email;
  final String password;
  final String profilePicture;
  final String fileId;

  User({
    required this.uuid,
    required this.createdAt,
    required this.username,
    required this.name,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.fileId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['id'],
      profilePicture: json['profile_picture'],
      fileId: json['file_id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      createdAt: DateTime.parse(json['created_at']),
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': uuid,
      'profile_picture': profilePicture,
      'file_id': fileId,
      'name': name,
      'email': email,
      'username': username,
      'created_at': createdAt.toIso8601String(),
      'password': password,
    };
  }
}
