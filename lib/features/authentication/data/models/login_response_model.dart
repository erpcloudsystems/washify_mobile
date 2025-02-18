class UserModel {
  UserModel({
    required this.name,
    required this.username,
    required this.sid,
    required this.userImage,
    required this.systemUser,
    required this.userId
  });
  final String? name;
  final String? username;
  final String? sid;
  final String? userImage;
  final String? systemUser;
  final String? userId;

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      username: map["full_name"],
      sid: map["sid"],
      userImage: map["user_image"],
      systemUser: map["system_user"],
      userId: map["user_id"]
    );
  }
}
