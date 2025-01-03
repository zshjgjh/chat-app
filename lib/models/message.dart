

import '../constants.dart';

class Message{
  final String message;
  final DateTime createdAt;
  final String id;

  Message({required this.message, required this.id, required this.createdAt});


  factory Message.fromJason(jsonData){
    return Message(message: jsonData[kMessage],
    createdAt:DateTime.parse(jsonData[kCreatedAt].toDate().toString()),
    id:jsonData[kID]);
}






}