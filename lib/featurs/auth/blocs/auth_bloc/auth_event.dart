part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class ShowPassword extends AuthEvent {}

final class HidePassword extends AuthEvent {}


