import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:scholar_chat/models/message.dart';

import '../constants.dart';

class FriendChatBubble extends StatelessWidget {
  const FriendChatBubble({
     required this.message,
  }) ;
  final Message message;

  @override
  Widget build(BuildContext context) {
    final time=DateFormat.jm().format(message.createdAt);

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32),
                topRight: Radius.circular(32) ,
                bottomLeft:  Radius.circular(32))
        ),
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.message,
                style: const TextStyle(
                    color: Colors.black,
                  fontSize: 20
                ),),
              Text('${time}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10
                ),),


            ],
          ),
        ),
      ),
    );
  }
}