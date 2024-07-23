
import 'package:cinema_booking_app/core/services/api/api_endpoints.dart';
import 'package:cinema_booking_app/features/login/data/models/login_request_body.dart';
import 'package:cinema_booking_app/features/login/data/models/login_response_body.dart';
import 'package:cinema_booking_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:cinema_booking_app/features/sign_up/data/models/sign_up_response_body.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@singleton
class ApiService{
  ApiService() {
    _userDio.interceptors.add(
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true),
    );
  }
  static final Dio _userDio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
    ),
  );
  Future<LoginResponseBody> login(LoginRequestBody loginRequestBody) async {
    final response = await _userDio.post(ApiEndpoints.login, data: {
      "email": loginRequestBody.email,
      "password":  loginRequestBody.password,
    });
    return LoginResponseBody.fromJson(response.data);
  }
  Future<SignUpResponseBody> register(SignUpRequestBody signUpRequestBody) async {
    final response = await _userDio.post(ApiEndpoints.signup, data: {
      "name": signUpRequestBody.name,
      "email": signUpRequestBody.email,
      "password":  signUpRequestBody.password,
      "cpassword":  signUpRequestBody.cpassword,
      "phone":  signUpRequestBody.phone,
    });
    return SignUpResponseBody.fromJson(response.data);
  }


}