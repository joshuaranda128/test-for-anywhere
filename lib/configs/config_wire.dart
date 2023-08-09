import 'package:demo_real_estate_project/core/_shared/data/model/app_config.dart';
import 'package:get/get.dart';

void configWire() {
  Get.put<AppConfig>(
    AppConfig(
      flavorName: 'wire',
      baseUrl: 'http://api.duckduckgo.com/?q=the+wire+characters&format=json',
    ),
    permanent: true,
  );
}
