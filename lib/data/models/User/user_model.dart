class User {
  String? uuid;

  String? username;
  String? name;
  String? email;
  String? password;
  String? profilePicture;
  String? fileId;

  User({
    this.uuid,
    this.username,
    this.name,
    this.email,
    this.password,
    this.profilePicture,
    this.fileId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      profilePicture: json['profile_picture'],
      fileId: json['file_id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
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
      'password': password,
    };
  }
}
