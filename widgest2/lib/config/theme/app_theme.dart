import 'package:flutter/material.dart';

const ColorList=[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.amber,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lime,
  Colors.yellow,
];

class AppTheme{
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0,
  }): assert(selectedColor >= 0, 'El color seleccionado tiene que ser mayor a 0 ' ),
  assert(selectedColor < ColorList.length, 'El color seleccionado tiene que ser menor a ${ColorList.length} ');

  ThemeData getTheme ()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: ColorList[selectedColor], 
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    ) 
  );

}