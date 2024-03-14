import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:teeeemj/repository/auth_repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.repository,
  }) : super(AuthInitial());
  final AuthRepository repository;
  Future<void> signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final result = await repository.signUp(email: email, password: password);
      emit(AuthSuccess(userCredential: result));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(AuthError(errorText: e.message ?? ''));
      } else {
        emit(AuthError(errorText: e.toString()));
      }
    }
  }
}
