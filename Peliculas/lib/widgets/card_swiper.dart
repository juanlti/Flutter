import 'package:app_peliculas/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiperScreen extends StatelessWidget {
  CardSwiperScreen({Key? key, required this.movies}) : super(key: key);
  final List<Movie> movies;
  //final imagenInternet = 'https://via.placeholder.com/300x400';

  @override
  Widget build(BuildContext context) {
    final sizeGenral = MediaQuery.of(context).size;
    final int countImage = 10;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: sizeGenral.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
        width: double.infinity,
        height: sizeGenral.height * 0.5,
        child: Swiper(
          autoplayDisableOnInteraction: false,
          indicatorLayout: PageIndicatorLayout.DROP,
          itemHeight: sizeGenral.height * 0.5,
          itemWidth: sizeGenral.width * 0.5,
          itemCount: countImage,
          layout: SwiperLayout.STACK,
          itemBuilder: (context, index) {
            final peliculaObtenida = movies[index];

            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'detials',
                    arguments: peliculaObtenida);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(seconds: 2),
                    placeholder: const AssetImage('assets/image/no-image.jpg'),
                    image: NetworkImage(peliculaObtenida.ImagenDePelicula)),
              ),
            );
          },
        ));
  }
}
