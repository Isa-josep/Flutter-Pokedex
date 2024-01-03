import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' show Random;
class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screnns'),
      ),
      body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            context.pop();
          },
        ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity, // toma todo el ancho posible, que le de el padre

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          //crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: const Text('ElevatedButton')
            ),


            const ElevatedButton(
              onPressed: null, 
              child: Text('ElevatedDisable')
            ),
      
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.access_alarm_outlined), 
              label: const Text('ElevatedButton.icon')
            ),

            FilledButton(
              onPressed: (){}, 
              child: const Text("FilledButton")
              ),

            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.add_business_rounded), 
              label: const Text('FilledButton.icon')
            ),

            OutlinedButton(
              onPressed: (){},
              child: const Text('Outline')
            ),

            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.terminal), 
              label: const Text('OutlinedButton.icon')
            ),

            TextButton(
              onPressed: (){}, 
              child: const Text('TextBtn')
            ),

            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.add_ic_call), 
              label: const Text('TextButton.icon')
            ),

            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add_a_photo_outlined)
            ),

            const CustomButton(),
            const CustomButton2(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override

  
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme; 

    return   ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child:   InkWell(
          onTap: (){},
          child:  const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10 ),
            child: Text("Hola mundo")
            ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatefulWidget {
  const CustomButton2({super.key});

  @override
  CustomButton2State createState() => CustomButton2State();
}

class CustomButton2State extends State<CustomButton2> {
  late Color _currentColor;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentColor = _getRandomColor();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentColor = _getRandomColor();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Color _getRandomColor() {
    final random = Random();
    return Color((random.nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: _currentColor,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Hola mundo"),
          ),
        ),
      ),
    );
  }
}
