import 'package:demo_real_estate_project/core/di/injection_container_imports.dart';
import 'package:get/get.dart';

class InjectableDataSources {
  InjectableDataSources.inject() {
    Get.lazyPut<CharacterRemoteDataSource>(
      CharacterRemoteDataSourceImpl.new,
      fenix: true,
    );
  }
}
