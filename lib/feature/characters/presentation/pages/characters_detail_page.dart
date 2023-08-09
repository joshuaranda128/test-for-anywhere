import 'package:demo_real_estate_project/core/_shared/presentation/widgets/custom_app_bar.dart';
import 'package:demo_real_estate_project/feature/characters/domain/entity/character_data.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/widgets/character_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharactersDetailPage extends StatelessWidget {
  CharactersDetailPage({super.key});

  final Character character = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final parts = character.text!.split(' - ');
    final characterName = parts[0].trim();
    final characterDescription = parts[1].trim();
    return Scaffold(
      appBar: CustomAppBar(title: Text(characterName)),
      body: ListView(
        children: [
          CharactersImage(image: character.icon!.url),
          Container(
            margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
            child: Text(
              characterDescription,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
