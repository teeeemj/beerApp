part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetInitial extends ResetPasswordState {}

final class ResetSuccess extends ResetPasswordState {}

final class ResetError extends ResetPasswordState {
  final String errorText;

  ResetError({required this.errorText});
}

final class ResetLoading extends ResetPasswordState {}
