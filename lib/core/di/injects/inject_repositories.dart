import 'package:demo_real_estate_project/core/di/injection_container_imports.dart';
import 'package:get/get.dart';

class InjectableRepositories {
  InjectableRepositories.inject() {
    Get.lazyPut<CharacterRepository>(
      () => CharacterRepositoryImpl(fetchRemoteDataSource: Get.find()),
      fenix: true,
    );
  }
}
