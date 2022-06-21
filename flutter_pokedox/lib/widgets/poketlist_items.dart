import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/constants.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';
import 'package:flutter_pokedox/pages/detail_page.dart';
import 'package:flutter_pokedox/widgets/poke_img_bal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeListItems extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItems({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        color: UIHelper.getBackColor(pokemon.type![0]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.w),
        ),
        child: Padding(
          padding: UIHelper.getDefaultPaddig(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                pokemon.name!,
                style: Sabitler.pokemonNameTextStyle(),
              ),
              Chip(
                label: Text(
                  pokemon.type![0],
                  style: Sabitler.labelTextStyle(),
                ),
              ),
              Expanded(child: PokeImgBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
