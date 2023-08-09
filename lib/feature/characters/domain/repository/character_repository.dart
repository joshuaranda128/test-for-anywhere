import 'package:demo_real_estate_project/core/utils/generic_typedefs.dart';
import 'package:demo_real_estate_project/feature/characters/domain/entity/character_data.dart';

// ignore: one_member_abstracts
abstract class CharacterRepository {
  EitherDynamic<CharacterDetails> fetchCharacterData();
}
