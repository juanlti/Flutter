import 'dart:async';

import 'package:app_peliculas/helpers/debouncer.dart';
import 'package:app_peliculas/models/credits_response.dart';
import 'package:app_peliculas/models/decode_playing_response.dart';
import 'package:app_peliculas/models/movie.dart';
import 'package:app_peliculas/models/popular.dart';
import 'package:app_peliculas/models/search_response.dart';
import 'package:app_peliculas/screens/screens.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apikey = '084c1e3ff678f2a89ae5387d32b9aad7';
  String _baseUrl = 'api.themoviedb.org';
  String _lenguaje = 'es-ES';

  List<Movie> peliculas = [];
  List<Movie> populares = [];

  int _countPageImagePopular = 0;
  final Debouncer debouncer = Debouncer(duration: Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStrreanController =
      new StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream =>
      this._suggestionStrreanController.stream;

  Map<int, List<Cast>> infoCast = {};

  MoviesProvider() {
    //  print('MoviesProvider iniciali');
    getInfoMovies();
    getInfoPopilares();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    final urlData = Uri.https(_baseUrl, endPoint, {
      'api_key': _apikey,
      'language': _lenguaje,
      'page': '$page',
    });
    var responseWithData = await http.get(urlData);

    if (responseWithData.statusCode == 200) {
      //Ok
      return responseWithData.body;
    } else {
      //CONFLICTO
      return "";
    }
  }

  getInfoMovies() async {
    // print('informacion Obtenida');

    //obtengo la url a consumir.
/*
    var urlData = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _lenguaje,
      'page': '1',
    });

    var responseWithData = await http.get(urlData);
*/
//jsonData obtengo la informacion
    final jsonData = await _getJsonData('3/movie/now_playing');
    //si esta en la condicion, informacion correcta, caso contrario urlData contiene informacion ERRONEA
    print('estoy aca');
    // print(responseWithData.body);

    // informacionObtenida instancia de map
    //deserializo la informacion de jsonData
    final informacionObtenida = NowPlayingResponse.fromJson(jsonData);
    peliculas = informacionObtenida.results;

    //Caso afirmativo
    //convierto la informacion en informacion legible para el telefono, un Map
/*
    Map<String, dynamic> informacionCorrecta =
        convert.jsonDecode(responseWithData.body) as Map<String, dynamic>;
        */

    // print('Luego');
    //print(informacionCorrecta["results"].toString());

    //detecta que cuales fueron los cambios y los re-dibuja
    notifyListeners();
  }

  getInfoPopilares() async {
    // print('informacion Obtenida');

    //obtengo la url a consumir.
    _countPageImagePopular++;
    //jsonData obtengo la informacion
    final jsonData =
        await _getJsonData('3/movie/now_playing', _countPageImagePopular);
/*
    var urlData = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apikey,
      'language': _lenguaje,
      'page': '${_countPageImagePopular}',
    });
    print('cantidad de pages ? $_countPageImagePopular');
    var responseWithData = await http.get(urlData);
*/
    //si esta en la condicion, informacion correcta, caso contrario urlData contiene informacion ERRONEA
    print('estoy aca');
    // print(responseWithData.body);

    // informacionObtenida instancia de map
    final popularesResponse = PopularResponse.fromJson(jsonData);

    populares = [...populares, ...popularesResponse.results];

    print('pagina actual ${popularesResponse.page}');

    //Caso afirmativo
    //convierto la informacion en informacion legible para el telefono, un Map
/*
    Map<String, dynamic> informacionCorrecta =
        convert.jsonDecode(responseWithData.body) as Map<String, dynamic>;
        */

    //print('Luego');
    //print(informacionCorrecta["results"].toString());

    //detecta que cuales fueron los cambios y los re-dibuja
    notifyListeners();
  }

  Future<List<Cast>> getInfoActores(int movieId) async {
    //https://api.themoviedb.org/3/movie/508947/credits?api_key=084c1e3ff678f2a89ae5387d32b9aad7&language=es-ES&page=1

    if (infoCast.containsKey(movieId)) return infoCast[movieId]!;
    print('pidiendo informacion de actores');
    //consigo la url
    final jsonData = await _getJsonData('3/movie/$movieId/credits');

    //decodifico la informacion obtenida previamente (url)
    final creditsResponde = CreditsMovie.fromJson(jsonData);

    //agrego la informacion

    infoCast[movieId] = creditsResponde.cast;

    //print('nombre del actor  ${creditsResponde.cast[1].NameCrew}');

    return creditsResponde.cast;
  }

  Future<List<Movie>> searchMovies(String consulta) async {
    final urlData = Uri.https(_baseUrl, '3/search/movie', {
      'api_key': _apikey,
      'language': _lenguaje,
      'query': consulta,
    });

    //solicito inormacion
    final response = await http.get(urlData);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }

  void getSeggestionsByQuery(String informacionObtenida) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      //print('tenemos valor a buscar ${informacionObtenida}');
      //    print('123123123');
      final resultado = await this.searchMovies(value);
      this._suggestionStrreanController.add(resultado);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = informacionObtenida;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }

  /*
  void getSeggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      print('Hay valorr $value');
    };
    debouncer.value = query;
  }
  */
}
