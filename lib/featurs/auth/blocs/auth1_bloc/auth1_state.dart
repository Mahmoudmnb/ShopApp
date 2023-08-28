part of 'auth1_bloc.dart';

@immutable
sealed class Auth1State {}

final class Auth1Initial extends Auth1State {}

final class EmailText extends Auth1State {
  final String emailText;
  EmailText({required this.emailText});
}
