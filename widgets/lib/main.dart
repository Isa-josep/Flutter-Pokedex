import 'package:flutter/material.dart';
import 'package:widgets/config/theme/app_theme.dart';
import 'package:widgets/presentation/screens/buttons/button_screens.dart';
import 'package:widgets/presentation/screens/card/cards_screen.dart';
import 'package:widgets/presentation/screens/home/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 6).getTheme(),
      home:const HomeScreen(),
      routes: {
        '/button': (context) => ButtonsScreen(),
        '/cards': (context) => CardsScreen(),
      },
    );
  }
}

//TODO: crear una rama y migrar "git checkout -b master"

//TODO: Para regresar todos los cambios a un commit anterior "git checkout -- ."