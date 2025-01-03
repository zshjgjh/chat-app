import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> userRegister({required String email,required String password}) async {
    try {
      emit(RegisterLoadingState());
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      emit(RegisterSuccseeState());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailureState(errorMessage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailureState(errorMessage: 'email-already-in-use'));
      }
    }on Exception catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }
  }
  @override
  void onChange(Change<RegisterState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
