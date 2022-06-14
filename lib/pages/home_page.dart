import 'package:flutter/material.dart';
import 'package:pokedex_project/model/pokemon_model.dart';
import 'package:pokedex_project/services/pokedex_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PokemonModel>> _pokeList;

  @override
  void initState() {
    //
    super.initState();
    _pokeList = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PokemonModel>>(
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
      ),
    );
  }
}
