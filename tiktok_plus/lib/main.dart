import 'package:flutter/material.dart';
import 'package:tiktok_plus/config/themes/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_plus/presentation/providers/discover_provider.dart';
import 'package:tiktok_plus/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          //lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'TikTok Plus',
        debugShowCheckedModeBanner: false,
        theme: AppThemes().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}