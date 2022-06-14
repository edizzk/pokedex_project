import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model/pokemon_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(_url);

    debugPrint(result.toString());

    return _list;
  }
}
