import 'package:demo_real_estate_project/core/_shared/data/model/app_config.dart';
import 'package:demo_real_estate_project/core/error/exceptions.dart';
import 'package:demo_real_estate_project/core/services/api_service.dart';
import 'package:demo_real_estate_project/feature/characters/data/model/character_data_model.dart';
import 'package:get/get.dart';

// ignore: one_member_abstracts
abstract class CharacterRemoteDataSource {
  Future<CharacterDetailsModel> fetchCharacterData();
}

class CharacterRemoteDataSourceImpl extends CharacterRemoteDataSource {
  @override
  Future<CharacterDetailsModel> fetchCharacterData() async {
    final path = Get.find<AppConfig>().getBaseUrl;
    try {
      final raw = await Get.find<ApiService>().getRequest(path: path);
      final res = raw.data;
      final model = characterDetailsModelFromJson(res);
      for (final item in model.characterList!) {
        if (item.icon!.url != null && item.icon!.url!.isNotEmpty) {
          final url = "https://duckduckgo.com/${item.icon!.url!}";
          item.icon!.url = url;
        }
      }
      model.characterList!.removeAt(0);
      return model;
    } catch (e) {
      throw ServerException(error: e.toString());
    }
  }
}
