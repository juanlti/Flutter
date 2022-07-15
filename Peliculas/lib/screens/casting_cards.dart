import 'package:app_peliculas/models/credits_response.dart';

import 'package:app_peliculas/screens/screens.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

class CastingCastMovie extends StatelessWidget {
  final int movieId;
  const CastingCastMovie({Key? key, required this.movieId}) : super(key: key);
  final imagenInternet = 'https://via.placeholder.com/300x400';

  @override
  Widget build(BuildContext context) {
    final peliculasObtenidas =
        Provider.of<MoviesProvider>(context, listen: false);
    return mostrarActores(peliculasObtenidas);
  }

  FutureBuilder<List<Cast>> mostrarActores(MoviesProvider peliculasObtenidas) {
    return FutureBuilder(
        future: peliculasObtenidas.getInfoActores(movieId),
        builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              constraints: BoxConstraints(maxWidth: 150),
              height: 100,
              child: CupertinoActivityIndicator(),
            );
          }
          final List<Cast> unActor = snapshot.data!;
          return Container(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: unActor.length,
              itemBuilder: (_, index) => _CastCard(
                unActor: unActor[index],
                imagenPrueba: imagenInternet,
              ),
            ),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  final Cast unActor;
  final String imagenPrueba;
  const _CastCard({required this.unActor, required this.imagenPrueba});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 110,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          //foto de actor

          //nombre de actor
          //Text('INFO ${movieInfo.titileMovie}'),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
              fit: BoxFit.cover,
              fadeInDuration: const Duration(seconds: 2),
              placeholder: const AssetImage('assets/image/no-image.jpg'),
              image: NetworkImage(unActor.ImagenCrew),
              width: 100,
              height: 140,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              '${unActor.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
