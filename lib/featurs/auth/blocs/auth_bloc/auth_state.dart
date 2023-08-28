part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class VisiblePassword extends AuthState {
  final bool isVisible;
  VisiblePassword({required this.isVisible});
}

