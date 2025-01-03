part of 'chat_cubit.dart';


 class ChatState {}

class ChatInitialState extends ChatState {}

class ChatSuccessState extends ChatState {
  ChatSuccessState({required this.messagesList});
  List<Message> messagesList;
}

class ChatFailureState extends ChatState {}
