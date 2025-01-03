part of 'register_cubit.dart';

@immutable
class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccseeState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  RegisterFailureState({required this.errorMessage});
  final String errorMessage;
}
