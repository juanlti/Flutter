import 'package:componentes/models/menu_option.dart';
import 'package:componentes/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

class AppRoutes {
  static const initialRoute = 'homePage';

  static final List<MenuOption> menuOption = [
    MenuOption(
        route: 'listview1_screen',
        icon: Icons.list,
        name: 'List View 1',
        screen: const ListView1Screen()),
    MenuOption(
        route: 'alert_screen',
        icon: Icons.home,
        name: 'Alert Page ',
        screen: const AlertScreen()),
    MenuOption(
        route: 'listview2_screen',
        icon: Icons.list_alt_sharp,
        name: 'List View 2',
        screen: const ListView1Screen2()),
    MenuOption(
        route: 'card_screen',
        icon: Icons.card_giftcard,
        name: 'Card Credit',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar_screen',
        icon: Icons.supervised_user_circle,
        name: 'Card Credit',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'AnimatedScreen',
        icon: Icons.animation_rounded,
        name: 'AnimatedScreen',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'InputsScren',
        icon: Icons.text_fields,
        name: 'Formularios',
        screen: const InputScreen()),
    MenuOption(
        route: 'SliderScrool',
        icon: Icons.text_fields,
        name: 'Slider',
        screen: const SliderScroolViewScreen()),
    MenuOption(
        route: 'ListViewBuilder',
        icon: Icons.text_fields,
        name: 'ListViewBuilder',
        screen: const ListViewBuilder()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    final cantidadDeOpciones = menuOption.length;
    if (appRoutes.isEmpty) {
      //estoy vacio
      print('estoy vacio');
      appRoutes.addAll({'homePage': (context) => const HomePage()});
    }

    /*
    for (final routSelect in menuOption) {
      appRoutes.addAll({routSelect.route: (context) => routSelect.screen});
  
    }
    */
    for (int i = 0; i < cantidadDeOpciones; i++) {
      final pageTempRoute = menuOption[i].route;
      final pageTempScren = menuOption[i].screen;

      appRoutes.addAll({pageTempRoute: (context) => pageTempScren});
    }

    return appRoutes;
  }

// forma 01 de establecer rutas
/*
  static final routes = {
    'homePage': (context) => const HomePage(),
    'alert_screen': (context) => const AlertScreen(),
    'listview1_screen': (context) => const ListView1Screen(),
    'listview2_screen': (context) => const ListView1Screen2(),
    'card_screen': (context) => const CardScreen(),
  };
*/
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
