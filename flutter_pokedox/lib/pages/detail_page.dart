import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_pokedox/model/pokemon_model.dart';
import 'package:flutter_pokedox/widgets/poke_type_name.dart';
import 'package:flutter_pokedox/widgets/pokemon_infomation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'assets/images/pokeboll.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _screenPortraitBody(context, imgUrl)
        : _screenLandscapeBody(context, imgUrl);
  }

  _screenLandscapeBody(BuildContext context, String imgUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getBackColor(
        pokemon.type![0],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPaddig(),
              child: IconButton(
                iconSize: 20.w,
                icon: Icon(Icons.arrow_back),
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: UIHelper.getDefaultPaddig(),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          PokeTypeName(pokemon: pokemon),
                          Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              width: UIHelper.calculategetImage(),
                              height: 0.24.sw,
                              imageUrl: pokemon.img ?? '',
                              fit: BoxFit.fitHeight,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: PokeInformation(
                          pokemon: pokemon,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Scaffold _screenPortraitBody(BuildContext context, String imgUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getBackColor(
        pokemon.type![0],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPaddig(),
              child: IconButton(
                iconSize: 0.04.sh,
                icon: Icon(Icons.arrow_back),
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
              ),
            ),
            PokeTypeName(pokemon: pokemon),
            SizedBox(
              height: 10.w,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      imgUrl,
                      height: 0.15.sh,
                      fit: BoxFit.fitWidth,
                    ),
                    right: 0,
                    top: 0,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.14.sh,
                    child: PokeInformation(pokemon: pokemon),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? '',
                        height: 0.25.sh,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
