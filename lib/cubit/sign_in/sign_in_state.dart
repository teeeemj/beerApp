part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserCredential userCredential;

  SignInSuccess({required this.userCredential});
}

final class SignInError extends SignInState {
  final String errorText;

  SignInError({required this.errorText});
}

final class SignInLoading extends SignInState {}
