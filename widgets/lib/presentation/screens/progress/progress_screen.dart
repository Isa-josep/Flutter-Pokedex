import 'package:flutter/material.dart';

class ProgressScren extends StatelessWidget {
  static const name='progress_screen';
  const ProgressScren({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Progress Screen"),
        ),
        body: const  _Progress_view(),
    );
  }
}

class _Progress_view extends StatelessWidget {
  const _Progress_view();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("Circular progres "),
          SizedBox(height: 30,),
          CircularProgressIndicator(strokeWidth: 2,),
          SizedBox(height: 30,),
          Text("Circular progres controlado "),
          SizedBox(height: 15,),

          _ControlledProgresIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgresIndicator extends StatelessWidget {
  const _ControlledProgresIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(

      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value*2)/100;
      }).takeWhile((value) => value <100),
      builder: (context, snapshot) {

        final progressValue =snapshot.data??0;

        return  Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: progressValue,
              ),
              const SizedBox(width: 20,),
              Expanded(child: LinearProgressIndicator(value: progressValue),
              )
            ],
          ),
        );
      }
    );
  }
}