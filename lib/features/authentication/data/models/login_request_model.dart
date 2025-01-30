class LoginRequestModel {
  final String userName;
  final String password;
  LoginRequestModel({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usr': '2$userName',
      'pwd': password,
    };
  }
}
