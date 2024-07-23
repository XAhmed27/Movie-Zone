import 'package:bloc/bloc.dart';
import 'package:cinema_booking_app/core/services/api/api_service.dart';
import 'package:cinema_booking_app/features/login/data/models/login_request_body.dart';
import 'package:cinema_booking_app/features/login/data/models/login_response_body.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._apiservice) : super(LoginInitial());
  final ApiService _apiservice;
  Future<void> login(LoginRequestBody requestBody) async {
    emit(LoginLoading());
    Future.delayed(Duration(seconds: 3));
    try {
      final LoginResponseBody response = await _apiservice.login(requestBody);
      emit(LoginSuccess(loginResponseBody: response));
    } on Exception catch (e) {
      emit(LoginError(message: e.toString()));
    }
  }
}
