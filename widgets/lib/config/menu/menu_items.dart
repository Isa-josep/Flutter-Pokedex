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
    link: '/cards',
    icon: Icons.credit_card,
  ),

  MenuItem(
    title: 'ProgresIndicator',
    subTitle: 'Generales y controlados ',
    link: '/progress',
    icon: Icons.refresh,
  ),

  MenuItem(
    title: 'SnackBar y dialogos',
    subTitle: 'snackbar, alert, simpleDialog, alertDialog ',
    link: '/snackbar',
    icon: Icons.info_outline,
  ),

  MenuItem(
    title: 'Animated container',
    subTitle: 'widget animado',
    link: '/animated',
    icon: Icons.check_box,
  ),
];