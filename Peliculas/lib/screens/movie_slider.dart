import 'package:app_peliculas/models/movie.dart';
import 'package:app_peliculas/screens/screens.dart';
import 'package:flutter/material.dart';

//await Future.delayed(const Duration(seconds: 5));

class MovieSlider extends StatefulWidget {
  const MovieSlider(
      {Key? key,
      required this.peliculasPopulares,
      required this.chargedingNextPage})
      : super(key: key);
  final List<Movie> peliculasPopulares;
  final Function chargedingNextPage;

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final imagenInternet = 'https://via.placeholder.com/300x400';
  final informacionDeListView = ScrollController();

  initState() {
    super.initState();
    //inicializar los pixeles
    informacionDeListView.addListener(() {
      print(informacionDeListView.position.pixels);
      print('234234234 ${informacionDeListView.position.maxScrollExtent}');
      if (informacionDeListView.position.pixels >=
          informacionDeListView.position.maxScrollExtent - 500) {
        print('volver a llamar');
        widget.chargedingNextPage();

        //recargar

      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.peliculasPopulares == 0) {
      return Container(
        width: double.infinity,
        height: 400,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
          width: double.infinity,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text('Populares'),
              ),
              Expanded(
                child: ListView.builder(
                    controller: informacionDeListView,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.peliculasPopulares.length,
                    itemBuilder: (_, int index) {
                      final peliculaPopular = widget.peliculasPopulares[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'detials',
                              arguments: peliculaPopular);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              Hero(
                                tag: peliculaPopular.id,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: FadeInImage(
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: 180,
                                      fadeInDuration:
                                          const Duration(seconds: 2),
                                      placeholder: const AssetImage(
                                          'assets/image/no-image.jpg'),
                                      image: NetworkImage(
                                          peliculaPopular.ImagenDePopulares)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                  child: Text(
                                peliculaPopular.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ));
    }
  }
}
