import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:teeeemj/repository/auth_repository/auth_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.repository}) : super(ResetInitial());

  final AuthRepository repository;

  Future<void> resetPassword({required String email}) async {
    emit(ResetLoading());
    try {
      repository.resetPassword(email: email);
      emit(ResetSuccess());
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(ResetError(errorText: e.message ?? ''));
      } else {
        emit(ResetError(errorText: e.toString()));
      }
    }
  }
}
