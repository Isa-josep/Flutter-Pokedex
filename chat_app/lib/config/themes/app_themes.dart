import 'package:flutter/material.dart';

const Color _customColorB =Color(0xFFB1C9EF);
const Color _customColorB2 =Color(0xFFB1C9EF);
const Color _customColorG =Color(0xFFCFE1B9);
const Color _customColorG2 =Color(0xFFE9F5DB);
const Color _customColorR =Color(0xFFF67665);
const List<Color> _colorThemes=[
    _customColorB,
    _customColorB2,
    _customColorG,
    _customColorG2,
    _customColorR,
];

class AppTheme{
  
  final int selectedColor;

  AppTheme({
     this.selectedColor=2,
    }):assert(selectedColor>=0 && selectedColor<=_colorThemes.length-1,'Eres un wey no te salgas de index');

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor], 
    );
  }
}