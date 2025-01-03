import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/models/message.dart';
import 'package:scholar_chat/widgets/friend_chat_bubble.dart';
import '../widgets/chat_bubble.dart';


class ChatPage extends StatelessWidget {

  static String id = 'ChatPage';

  TextEditingController controller = TextEditingController();

  ScrollController scrollController = ScrollController();
  List<Message> messagesList=[] ;

  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo, height: 60,),
            const Text('Chat',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),)
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {

                  if (state is ChatSuccessState) {
                      messagesList=state.messagesList;
                  }
                  },
                  builder: (context,state) {
                        return ListView.builder(
                            reverse: true,
                            itemCount: messagesList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return messagesList[index].id == email ? ChatBubble(
                                message: messagesList[index],) : FriendChatBubble(
                                  message: messagesList[index]);
                            });
                      }
                    )
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              child: TextField(
                controller: controller,
                onSubmitted: (data) {
                  BlocProvider.of<ChatCubit>(context).sendMessages(
                    message: data, email: email,);
                  BlocProvider.of<ChatCubit>(context).fetchMessages();

                  controller.clear();
                  scrollController.animateTo(scrollController.position.maxScrollExtent,
                     duration: const Duration(milliseconds: 500),
                   curve: Curves.easeIn);
                },

                decoration: InputDecoration(
                    suffix: IconButton(onPressed: () {

                    },
                      icon: const Icon(Icons.send),
                      color: kPrimaryColor,
                    ),
                    hintText: 'Send Message',
                    hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: kPrimaryColor
                        )
                    )
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

