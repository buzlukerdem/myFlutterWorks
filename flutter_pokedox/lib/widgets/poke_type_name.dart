import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/constants.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pokemon.name!,
              style: Sabitler.pokemonNameTextStyle(),
            ),
            Text(
              '#${pokemon.num}',
              style: Sabitler.pokemonNameTextStyle(),
            ),
          ],
        ),
        SizedBox(
          height: 0.05.sw,
        ),
        Chip(
          label: Text(
            pokemon.type?.join('  ,  ') ?? '',
            style: Sabitler.labelTextStyle(),
          ),
        )
      ],
    );
  }
}
