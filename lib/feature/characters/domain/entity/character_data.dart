class CharacterDetails {
  CharacterDetails({
    this.header,
    this.characterList,
  });

  final String? header;
  final List<Character>? characterList;
}

class Character {
  Character({
    this.icon,
    this.text,
  });

  final Icon? icon;
  final String? text;
}

class Icon {
  Icon({this.url});

  String? url;
}
