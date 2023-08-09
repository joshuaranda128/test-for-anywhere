import 'package:demo_real_estate_project/core/_shared/domain/usecases/usecase.dart';
import 'package:demo_real_estate_project/core/utils/generic_typedefs.dart';
import 'package:demo_real_estate_project/feature/characters/domain/entity/character_data.dart';
import 'package:demo_real_estate_project/feature/characters/domain/repository/character_repository.dart';

class FetchCharacterDataUC implements UseCase<CharacterDetails, NoParams> {
  FetchCharacterDataUC({required this.characterRepository});

  final CharacterRepository characterRepository;

  @override
  EitherDynamic<CharacterDetails> call(NoParams noParams) {
    return characterRepository.fetchCharacterData();
  }
}
