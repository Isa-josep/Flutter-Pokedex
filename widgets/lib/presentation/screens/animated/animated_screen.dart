import 'package:flutter/material.dart';
import 'dart:math' show Random;
class AnimatedScreen extends StatefulWidget {
  static const name='animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 100;
  double height = 100;
  Color color = Colors.indigo;
  double radius = 10.0;
  double topStart = 10.0;
  double topEnd = 10.0;
  double bottomStart = 10.0;
  double bottomEnd = 10.0;
  void cambiarForma(){
    final random = Random();

    width = random.nextInt(320)+40;
    height = random.nextInt(320)+40; // se agrega el 50, ya que puede generar 0 y si es ese caso se suman 50
    radius = random.nextDouble()*100;
    topStart = random.nextDouble()*100;
    topEnd = random.nextDouble()*100;
    bottomStart = random.nextDouble()*100;
    bottomEnd = random.nextDouble()*100;
    print(topStart);
    print(topEnd);
    print(bottomStart);
    print(bottomEnd);
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(10)+1,
    );
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),

      ),

      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
          width: width <= 0 ? 0:width , //evitar que el width sea 0
          height: height <= 0 ? 0:height, //evitar que el height sea 0
          decoration: BoxDecoration(
            color: color,

            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(topStart),
              topEnd: Radius.circular(topEnd),
              bottomStart: Radius.circular(bottomStart),
              bottomEnd: Radius.circular(bottomEnd),
            ) 
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: cambiarForma,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}