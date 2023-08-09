import 'package:demo_real_estate_project/core/di/injection_container_imports.dart';
import 'package:get/get.dart';

class InjectableUseCases {
  InjectableUseCases.inject() {
    Get.lazyPut<FetchCharacterDataUC>(
      () => FetchCharacterDataUC(characterRepository: Get.find()),
      fenix: true,
    );
  }
}
