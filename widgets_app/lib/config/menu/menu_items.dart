import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Counter',
      subTitle: 'Counter Riverpod',
      link: '/counter',
      icon: Icons.countertops_rounded),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y dialogos ',
      subTitle: 'Generales y controlados',
      link: '/snackbar',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container ',
      subTitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI controls + tiles ',
      subTitle: 'Una serie de controldes de flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introduccion a la aplicación',
      subTitle: 'Pequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'InfiniteScroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'Cambiar tema',
      subTitle: 'Cambiar tema aplicación',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined)
];
