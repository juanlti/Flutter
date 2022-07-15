import 'package:app_peliculas/models/movie.dart';
import 'package:app_peliculas/screens/screens.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  //recupero argumentos de la invocacion
  final imagenInternet = 'https://via.placeholder.com/300x400';

  @override
  Widget build(BuildContext context) {
    /*  final String informacionArgumentos =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'No movie';

        */

    final Movie informacionArgumentos =
        ModalRoute.of(context)!.settings.arguments as Movie;

//casteo 'as'
    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppBar(movieInfo: informacionArgumentos),
        SliverList(
          delegate: SliverChildListDelegate([
            _PostTitle(movieInfo: informacionArgumentos),
            _informationMovie(),
            CastingCastMovie(
              movieId: informacionArgumentos.id,
            ),
          ]),
        )
      ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movieInfo;

  const _CustomAppBar({required this.movieInfo});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      forceElevated: true,
      floating: true,
      backgroundColor: Colors.red,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          '${movieInfo.title}',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        // Text('Movie titile: ${informacionPelicula ?? 'no title' }'),
        background: FadeInImage(
            fadeOutDuration: const Duration(seconds: 5),
            fadeInDuration: const Duration(seconds: 5),
            placeholder: const AssetImage('assets/image/loading.gif'),
            image:
                NetworkImage(movieInfo.ImagenDePelicula ?? 'no hay pelicula')),
      ),
    );
  }
}

class _PostTitle extends StatelessWidget {
  final Movie movieInfo;

  const _PostTitle({required this.movieInfo});

  @override
  final imagenInternet = 'https://via.placeholder.com/300x400';

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(children: [
        Hero(
          tag: movieInfo.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
                fit: BoxFit.cover,
                height: 200,
                width: 150,
                //fadeInDuration: const Duration(seconds: 2),
                placeholder: const AssetImage('assets/image/no-image.jpg'),
                image: NetworkImage('${movieInfo.backdropPathImagenes}')),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieInfo.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                movieInfo.originalTitle,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 25,
                    color: Colors.grey,
                  ),
                  Text('${movieInfo.voteCount}'),
                ],
              ),
            ],
          ),
        ),

        /*
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Text(
                'TITULO',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              width: 200,
              child: Text(
                'TITUTLO ORIGINAL',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star_outline,
                  size: 25,
                  color: Colors.grey,
                ),
                Text('MovieVoteAve'),
              ],
            ),
          ],
        ),
        */
      ]),
    );
  }
}

class _informationMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
          'Cupidatat amet nisi sunt cillum. Sint dolor enim proident sint incididunt anim in sunt est nostrud in consectetur id consectetur. Nisi velit eu dolor sit non culpa amet cillum duis commodo sint tempor pariatur ad.'),
    );
  }
}
