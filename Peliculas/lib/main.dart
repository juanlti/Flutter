import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() {
  return runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 1 provider
        ChangeNotifierProvider(
            lazy: false,
            create: (_) {
              return MoviesProvider();
            }),
        // 2 provider
        /*
                     ChangeNotifierProvider(create: (_) {
          return MoviesProvider();
        }),

             */

        // 3 provider
        /*
                     ChangeNotifierProvider(create: (_) {
          return MoviesProvider();
        }),

             */
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'detials': (_) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigoAccent,
        ),
      ),
    );
  }
}
