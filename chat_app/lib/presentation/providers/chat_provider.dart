import 'package:chat_app/config/helpers/get_Api_answer.dart';
import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final  getApiAnswe = GetApiAnswe();


  List<Message> messageList =[
    // Message(text: "Hi, Marck ", fromWho: FromWho.me),
    // Message(text: "Hi, Isa", fromWho: FromWho.other),
   // Message(text: "Hi, Marck ", fromWho: FromWho.me),
   // Message(text: "Hi, Marck ", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    if(text.isEmpty) return; //si el texto esta vacio, no hace nada
    final message = Message(text: text, fromWho: FromWho.me);
    messageList.add(message);

    if(text.endsWith('?')){
       herReply();
    }

    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 100));
    moveScroll();
  }

  Future<void> herReply() async{
    final herMessage = await getApiAnswe.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScroll();
  }


  void moveScroll(){
    chatScrollController.animateTo( //animacion del scroll
      chatScrollController.position.maxScrollExtent,      //posiscion
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeInOut      //animacion del scroll
    );
  }
}