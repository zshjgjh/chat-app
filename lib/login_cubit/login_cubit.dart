import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> userSignin({required String email,required String password}) async {
    emit(LoginLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      emit(LoginSuccessState());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailureState(errorMessage: 'User not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailureState(errorMessage: 'Wrong password'));
      }
    } on Exception catch (e) {
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }
  @override
  void onChange(Change<LoginState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
