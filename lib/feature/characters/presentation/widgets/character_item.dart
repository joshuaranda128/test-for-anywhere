import 'package:demo_real_estate_project/core/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({
    required this.characterName,
    required this.onTap,
    super.key,
  });

  final String characterName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        characterName,
        style: const TextStyle(
          color: ThemeColors.clrWhite,
        ),
      ),
    );
  }
}
