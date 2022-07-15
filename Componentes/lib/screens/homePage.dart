import 'package:componentes/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOpt = AppRoutes.menuOption;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pagina Principal',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(
                menuOpt[index].icon,
                color: ThemeApp.themeAppBar.primaryColor,
              ),
              title: Text(menuOpt[index].name),
              onTap: () {
                // fomra de navevegar 01
                /*
                final route = MaterialPageRoute(
                  builder: (context) => const ListView1Screen2(),
                );
                
                Navigator.push(context, route);
                */

                //forma de navegar 02
                Navigator.pushNamed(
                  context,
                  menuOpt[index].route,
                );
              },
            );
          },
          separatorBuilder: (_, __) => const Divider(
                thickness: 2.0,
                color: Colors.red,
              ),
          itemCount: menuOpt.length),
    );
  }
}

