import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgest2/config/router/app_router.dart';
import 'package:widgest2/config/theme/app_theme.dart';


void main() {
  const ProviderScope(
    child: MainApp(),
  
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      title: "Widgets",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).getTheme(),
      
    );
  }
}

//TODO: crear una rama y migrar "git checkout -b master"

//TODO: Para regresar todos los cambios a un commit anterior "git checkout -- ."