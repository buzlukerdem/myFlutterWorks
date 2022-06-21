import 'package:flutter/material.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';
import 'package:flutter_pokedox/services/pokedex_api.dart';
import 'package:flutter_pokedox/widgets/poketlist_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late final Future<List<PokemonModel>> _pokemonListFuture;
  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _list = snapshot.data!;
          return GridView.builder(
              itemCount: _list.length,
              gridDelegate:
                  // gridview kullandık ve SliverGridDelegateCount ile cros count u 2 yaptık aşağı 2 şerli sütun
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 4,
              ),
              itemBuilder: (context, index) {
                return PokeListItems(pokemon: _list[index]);
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Hata çıktı.'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      future: _pokemonListFuture,
    );
  }
}
