import 'package:dio/dio.dart';
import 'package:washify_mobile/core/network/api_constant.dart';
import 'package:washify_mobile/core/network/dio_helper.dart';

import '../../../../core/global/dependencies_container.dart';

abstract interface class BaseOtpServices {
  Future<void> sendOtp(String email);
  Future<String> verifyOtp(String email, int otp);
}

class OtpServices implements BaseOtpServices {
  final dio = sl<BaseDioHelper>();

  @override
  Future<void> sendOtp(String email) async {
    await dio.post(
      endPoint: ApiConstance.sendOtpEndPoint,
      data: {"email": email, "otp_email_template": "OTP Verify"},
    ) as Response;
  }

  @override
  Future<String> verifyOtp(String email, int otp) async {
    final response = await dio.post(
      endPoint: ApiConstance.verifyOtpEndPoint,
      data: {
        "email": email,
        "otp_code": otp.toString(),
      },
    ) as Response;
    return response.data['message'];
  }
}
