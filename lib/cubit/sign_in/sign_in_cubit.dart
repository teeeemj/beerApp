import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:teeeemj/repository/auth_repository/auth_repository.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.repository}) : super(SignInInitial());

  final AuthRepository repository;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      final result = await repository.signIn(email: email, password: password);
      emit(SignInSuccess(userCredential: result));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(SignInError(errorText: e.message ?? ''));
      } else {
        emit(SignInError(errorText: e.toString()));
      }
    }
  }
}
