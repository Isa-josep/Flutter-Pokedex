import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name='snackbar_screen';
  const SnackbarScreen({super.key});


  void showSnackbar(BuildContext context){
      ScaffoldMessenger.of(context).clearSnackBars();


      final snackBar = SnackBar(
        content: const Text('Hola Mundo'),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: (){},
         
        ),
         duration: const Duration(seconds: 2),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar
    );
  }


  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false, // evitar que se cierre al tocar fuera del dialogo
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Titulo'),
          content: const Text('Contenido'),
          actions: [
            TextButton(
              onPressed: ()=> Navigator.of(context).pop(), 
              child: const Text('Cerrar')
              ),
              FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar')),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  
                  children: [
                    const Text("Deserunt dolor est est proident proident nisi magna dolore velit ipsum.")
                  ]
                );
              }, 
              child: const Text('Licencias usadas ')
              ),


            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: const Text('Mostrar  dialogo ')
              ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text(' Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: ()=> showSnackbar(context),
      ),
    );
  }
}