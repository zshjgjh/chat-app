import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat.jm().format(message.createdAt);

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(7),
        decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))
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
              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  if(state is ChatSuccessState){
                    return Text('${time}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),);
                  }else{
                    return const Icon(Icons.error);
                  }

                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}