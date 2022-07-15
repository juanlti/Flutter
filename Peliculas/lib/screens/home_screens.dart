import 'package:app_peliculas/screens/screens.dart';
import 'package:app_peliculas/widgets/widget.dart';
import 'package:provider/provider.dart';

import 'movieSearchDelegate.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final peliculasObtenidas = Provider.of<MoviesProvider>(context);
    final sizeScren = MediaQuery.of(context).size;

    print(
        'muestro informacion de peliculas ==> ${peliculasObtenidas.peliculas}');
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MovieSearchDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ))
          ],
          title: const Text('Peliculas'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              CardSwiperScreen(
                movies: peliculasObtenidas.peliculas,
              ),
              const SizedBox(
                height: 20,
              ),
              MovieSlider(
                  peliculasPopulares: peliculasObtenidas.populares,
                  chargedingNextPage: () =>
                      {peliculasObtenidas.getInfoPopilares()}),
            ],
          ),
        ));
  }
}
