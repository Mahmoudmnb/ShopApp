import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'auth1_event.dart';
part 'auth1_state.dart';

class Auth1Bloc extends Bloc<Auth1Event, Auth1State> {
  Auth1Bloc() : super(Auth1Initial()) {
    on<Auth1Event>((event, emit) {
      if (event is ChangeEmailText) {
        emit(EmailText(emailText: event.emailText));
      }
    });
  }
}
