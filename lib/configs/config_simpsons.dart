import 'package:demo_real_estate_project/core/_shared/data/model/app_config.dart';
import 'package:get/get.dart';

void configSimpsons() {
  Get.put<AppConfig>(
    AppConfig(
      flavorName: 'simpsons',
      baseUrl: 'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
    ),
    permanent: true,
  );
}
