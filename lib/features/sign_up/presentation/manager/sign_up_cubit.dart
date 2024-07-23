import 'package:cinema_booking_app/core/services/api/api_service.dart';
import 'package:cinema_booking_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:cinema_booking_app/features/sign_up/data/models/sign_up_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';
@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._apiservice) : super(SignUpInitial());
  final ApiService _apiservice;
  Future<void> register(SignUpRequestBody signUpRequestBody) async {
    emit(SignUpLoading());
    try {
      final SignUpResponseBody response = await _apiservice.register(signUpRequestBody);
      emit(SignUpSuccess(signUpResponseBody: response));
    } on Exception catch (e) {
      emit(SignUpError(message: e.toString()));
    }
  }
}
