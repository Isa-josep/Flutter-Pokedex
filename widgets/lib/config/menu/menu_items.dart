import 'package:flutter/material.dart';

class MenuItem{ 
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Button',
    subTitle: 'Variedad de botones',
    link: '/button',
    icon: Icons.smart_button_outlined,
  ),

  MenuItem(
    title: 'Tarjetad',
    subTitle: 'Contenedor cards',
    link: '/card',
    icon: Icons.credit_card,
  ),

];