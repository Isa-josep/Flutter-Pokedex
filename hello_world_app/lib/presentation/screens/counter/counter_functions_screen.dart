//import 'dart:ffi';

import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  
  int clickcounter=0;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar: AppBar(
          title: const Text("Counter functions"),
          actions: [
            IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: (){
              setState(() {
              clickcounter=0;
            });
            }),
          ], 
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$clickcounter", 
              style: const TextStyle(fontSize: 160,fontWeight: FontWeight.w100)),
               Text(clickcounter==1?"Click":"Clicks",
              style:  const TextStyle(fontSize: 25)),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
                ButtonACT(
                  icon:Icons.refresh_outlined,
                  onPressed: (){
                    setState(() {
                      clickcounter=0;
                    });
                  
                  },
                ),
                
            const SizedBox(height: 15,),

             ButtonACT(
              icon:Icons.exposure_minus_1,
              onPressed: (){
                if(clickcounter==0) return;
                setState(() {
                  clickcounter-=1;
                });
              },
              ),

            const SizedBox(height: 15,),
              ButtonACT(
              icon:Icons.plus_one,
              onPressed: (){
                setState(() {
                  clickcounter+=1;
                });
              },
              ),
          ],)
    );
  }
}

class ButtonACT extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;
  
  const ButtonACT({
    super.key, 
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(),
        enableFeedback: true,
        elevation: 10,
        onPressed: onPressed,
        child:  Icon(icon
      ),
    );
  }
}