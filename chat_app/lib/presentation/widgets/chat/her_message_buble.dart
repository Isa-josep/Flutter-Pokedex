import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBuble extends StatelessWidget {
  final Message message;
  const HerMessageBuble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

      final colors= Theme.of(context).colorScheme; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Container(
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(20)
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child:  Text(message.text, 
          style:  const TextStyle(color: Colors.white),),
        ),
      ),
      const SizedBox(height: 5,),

      // const Text("12:00 pm", style: TextStyle(color: Colors.black45),),

      //TODO: Agregar hora en la que se mandan los mensaje y que se muestre en el chat

       _ImageBubble(message.image!),

      const SizedBox(height: 10,),
    ],);
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUlr;

  const _ImageBubble(this.imageUlr);
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUlr,
      width: size.width * 0.7,
      height: 160,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if(loadingProgress == null) return child;  // si no hay progreso de carga, regresa el child
        return const Center(child: CircularProgressIndicator()); // si hay progreso de carga, regresa un circular progress indicator
      },
      ));
  }
}