class ApiConstance {
  static const String siteUrl = 'https://washify.mobi/';
  static const String baseUrl = '${siteUrl}api/';

  /// Authentication
  static const String loginEndPoint = 'method/login';
  static const String signUpEndPoint =
      'method/washify.overrides.whitelist.authentication.sign_up.sign_up';
  static const String governorateEndPoint = 'resource/Territory';
  static const String referralSourceEndPoint = 'resource/Lead Source';
  // OTP
  static const String sendOtpEndPoint =
      'method/washify.overrides.whitelist.authentication.otp.request_otp';
  static const String verifyOtpEndPoint =
      'method/washify.overrides.whitelist.authentication.otp.confirm_otp';

  // Subscription
  static const String getSubscriptionEndPoint = 'resource/Subscription Plan';
  static const String getVisitsEndPoint = 'resource/Scheduled Maintenance';

  // Car
  static const String brandsEndPoint = 'resource/Brand';
  static const String requestServiceEndPoint = 'resource/Request Service';

  // Shop
  static const String getShopItemsEndPoint = 'resource/Item';
}
