import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/her_message_buble.dart';
import 'package:chat_app/presentation/widgets/chat/my_menssage_buble.dart';
import 'package:chat_app/presentation/widgets/shared/message_Fied_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.forbes.com.mx/2023/09/mark-Zuckerberg-1-640x360.png'),
          ),
        ),
        title: const Text('Mark Zuckerberg'),
        centerTitle: true,
      ),
      body: _ChatView(

      ),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   final chatProvider = context.watch<ChatProvider>();

    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: 
            ListView.builder(
              controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                    return (message.fromWho == FromWho.other)
                    ?  HerMessageBuble(message: message)
                    :  MyMessageBuble(message: message);
                },),
              ),
              
              MessageFieldBox(
                onValue: (value) {
                  chatProvider.sendMessage(value);
                },
              ),
          ],
        ),
      ),
    );
  }
}