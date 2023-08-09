import 'dart:convert';

import 'package:demo_real_estate_project/feature/characters/domain/entity/character_data.dart';

CharacterDetailsModel characterDetailsModelFromJson(String str) =>
    CharacterDetailsModel.fromJson(json.decode(str));

class CharacterDetailsModel extends CharacterDetails {
  CharacterDetailsModel({
    super.header,
    super.characterList,
  });

  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) =>
      CharacterDetailsModel(
        header: json["Heading"],
        characterList: json["RelatedTopics"] == null
            ? []
            : List<CharacterModel>.from(
                json["RelatedTopics"]!.map(
                  (x) => CharacterModel.fromJson(x as Map<String, dynamic>),
                ),
              ),
      );
}

class CharacterModel extends Character {
  CharacterModel({
    super.icon,
    super.text,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        icon: json["Icon"] == null ? null : IconModel.fromJson(json["Icon"]),
        text: json["Text"],
      );
}

class IconModel extends Icon {
  IconModel({super.url});

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      IconModel(url: json["URL"]);
}
