class SignUpRequestModel {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? referralSource;

  SignUpRequestModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.referralSource,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "referral_source": referralSource,
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'mobile_no': phoneNumber,
    };
  }
}
