class SignUpRequestModel {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  SignUpRequestModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "referral_source": "Reference",
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'mobile_no': phoneNumber,
    };
  }
}
