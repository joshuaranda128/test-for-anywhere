import 'package:dartz/dartz.dart';
import 'package:demo_real_estate_project/core/_shared/presentation/controller/check_internet_controller.dart';
import 'package:demo_real_estate_project/core/error/exceptions.dart';
import 'package:demo_real_estate_project/core/error/failure.dart';
import 'package:demo_real_estate_project/core/utils/generic_typedefs.dart';
import 'package:demo_real_estate_project/feature/characters/data/datasources/character_remote_datasource.dart';
import 'package:demo_real_estate_project/feature/characters/domain/entity/character_data.dart';
import 'package:demo_real_estate_project/feature/characters/domain/repository/character_repository.dart';
import 'package:get/get.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({required this.fetchRemoteDataSource});

  final CharacterRemoteDataSource fetchRemoteDataSource;
  final checkInternetController = Get.find<CheckInternetController>();

  @override
  EitherDynamic<CharacterDetails> fetchCharacterData() async {
    if (checkInternetController.isConnected.value) {
      try {
        final data = await fetchRemoteDataSource.fetchCharacterData();
        return Right(data);
      } on ServerException catch (e) {
        return Left(GeneralFailure(error: e.error));
      }
    } else {
      return Left(GeneralFailure(error: "strError".tr));
    }
  }
}
