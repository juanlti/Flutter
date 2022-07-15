import 'dart:async';

import 'package:app_peliculas/models/movie.dart';
import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar pelicula';
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.backspace_sharp));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        '$query',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
/*
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        '$query',
        style: TextStyle(color: Colors.grey, fontSize: 20),
      ),
    );
    */
    Widget resultado;
    if (query.isEmpty) {
      resultado = _EmptyContainer();
    } else {
      print('buscando $query');
      //realiza la busqueda

      final moviesProvider =
          Provider.of<MoviesProvider>(context, listen: false);
      moviesProvider.getSeggestionsByQuery(query);

      resultado = StreamBuilder(
        stream: moviesProvider.suggestionStream,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          //resultado =Icon(Icons.dangerous); //snapshot contiene la lista de peliculas
          if (!snapshot.hasData) {
            //no tiene informacion

            resultado = _EmptyContainer();
          } else {
            //tiene informacion
            final movies = snapshot.data!;

            resultado = ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  resultado = ListaDePeliculasEncontradas(
                    movieSearch: movies[index],
                  );

                  return resultado;
                });
          }
          return resultado;
        },
      );
    }

    return resultado;
  }
}

class ListaDePeliculasEncontradas extends StatelessWidget {
  final Movie movieSearch;

  const ListaDePeliculasEncontradas({required this.movieSearch});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'detials', arguments: movieSearch);
          },
          title: Text('${movieSearch.titileMovie}'),
          subtitle: Text('${movieSearch.originalTitle}'),
          leading: FadeInImage(
            placeholder: const AssetImage('assets/image/no-image.jpg'),
            image: NetworkImage(movieSearch.ImagenDePelicula),
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _EmptyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Icon(
          Icons.local_dining,
          size: 130,
        ),
      ),
    );
  }
}
