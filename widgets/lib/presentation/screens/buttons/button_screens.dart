import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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