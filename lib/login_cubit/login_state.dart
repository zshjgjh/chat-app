part of 'login_cubit.dart';

@immutable
 class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
 LoginFailureState({required this.errorMessage});
 final String errorMessage;
}

