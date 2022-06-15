import 'package:flutter/material.dart';

import '../model/pokemon_model.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokeList;

  @override
  void initState(){
    super.initState();
    _pokeList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokeList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _list = snapshot.data!;
          return ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              var currentPokemon = _list[index];
              return ListTile(
                  title: Text(currentPokemon.name.toString())
              );
            },
          );
        }else if (snapshot.hasError){
          return const Center(child: Text("HATA ÇIKTI"));
        }else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
