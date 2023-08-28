part of 'auth1_bloc.dart';

@immutable
sealed class Auth1Event {}

final class ChangeEmailText extends Auth1Event {
  final String emailText;
  ChangeEmailText({required this.emailText});
}
