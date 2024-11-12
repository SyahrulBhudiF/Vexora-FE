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
      uuid: json['uuid'],
      createdAt: DateTime.parse(json['created_at']),
      username: json['username'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      profilePicture: json['profile_picture'],
      fileId: json['file_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'created_at': createdAt.toIso8601String(),
      'username': username,
      'name': name,
      'email': email,
      'password': password,
      'profile_picture': profilePicture,
      'file_id': fileId,
    };
  }
}
