String getCharacterName(String text) {
  final parts = text.split(' - ');
  final characterName = parts[0].trim();
  return characterName;
}
