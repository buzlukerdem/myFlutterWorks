import 'package:flutter/material.dart';
import 'package:flutter_pokedox/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import '../model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInformation({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPaddig(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInformationRow('Name', pokemon.name),
            _buildInformationRow('Height', pokemon.height),
            _buildInformationRow('Weight', pokemon.weight),
            _buildInformationRow('Spanw Time', pokemon.spawnTime),
            _buildInformationRow('Weakness', pokemon.weaknesses),
            _buildInformationRow('Pre Evolution', pokemon.prevEvolution),
            _buildInformationRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Sabitler.informationtextStyle(),
        ),
        if (value is List && value.isEmpty)
          Text(
            value.join('  ,  '),
          )
        else if (value == null)
          Text(
            'Not avaible.',
            style: Sabitler.informationtextStyle(),
          )
        else
          Text(
            value.toString(),
            style: Sabitler.informationtextStyle(),
          ),
      ],
    );
  }
}
