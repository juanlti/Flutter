import 'package:flutter/material.dart';

import 'screens/basic_desing.dart';
import 'screens/homeScreen.dart';
import 'screens/scrollScreen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Cambia de colors los indicadores de arriba
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'HomeScreen',
      routes: {
        'pageMain': (context) => const BasicDesingScren(),
        'ScrollScreens': (context) => const ScrollScreens(),
        'HomeScreen': (context) => const HomeScreen(),
        
      },
    );
  }
}
