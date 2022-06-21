import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';

class PokeImgBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'assets/images/pokeboll.png';
    return Stack(
      children: [
        Image.asset(
          imgUrl,
          width: UIHelper.calculategetImage(),
          height: UIHelper.calculategetImage(),
          fit: BoxFit.fitHeight,
        ),
        Hero(
          tag: pokemon.id!,
          child: CachedNetworkImage(
            width: UIHelper.calculategetImage(),
            height: UIHelper.calculategetImage(),
            imageUrl: pokemon.img ?? '',
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => const CircularProgressIndicator(),
          ),
        ),
      ],
      // internet den veri çekeceksek cachednetworkimage cache storage a ekleme yapıyor.
    );
  }
}
