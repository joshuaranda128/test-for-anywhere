import 'package:demo_real_estate_project/core/di/injection_container_imports.dart';
import 'package:get/get.dart';

class InjectableControllers {
  InjectableControllers.inject() {
    Get.lazyPut<CharacterDataController>(
      () => CharacterDataController(fetchCharacterDataUC: Get.find()),
      fenix: true,
    );
  }
}
