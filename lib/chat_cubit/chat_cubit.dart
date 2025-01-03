import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../constants.dart';
import '../models/message.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitialState());

  CollectionReference messages = FirebaseFirestore.instance.collection(
      kMessagesCollections);

  void sendMessages({required String message,required String email}) {
    try {
      messages.add({
        kMessage: message, kCreatedAt: DateTime.now(), kID: email
      });

      print('suc');
    } on Exception catch (e) {
      print('fail');
    }
  }

  void fetchMessages() {

    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messagesList = [];
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJason(doc));
      }
      emit(ChatSuccessState(messagesList: messagesList));
    });

    print('z');
  }
  @override
  void onChange(Change<ChatState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
