import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({Key? key, required this.onValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController texController = TextEditingController();
    final FocusNode focusNode = FocusNode(); // Mantener el valor de focus

    final InputDecoration inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      hintText: 'Escribe un mensaje',
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      filled: true,
      suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.attach_file_outlined),
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: (){
                final textValue = texController.value.text;
                texController.clear();
                onValue(textValue);
              },
            ),
          ],
        ));

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0), // Añade espacio solo en la parte inferior
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        }, // Remueve el focus en caso de hacer clic fuera del input
        focusNode: focusNode,
        controller: texController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          texController.clear();
          focusNode.requestFocus(); // Para que se mantenga el focus
          onValue(value);
        },
      ),
    );
  }
}


