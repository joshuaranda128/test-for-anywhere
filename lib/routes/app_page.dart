import 'package:demo_real_estate_project/feature/characters/presentation/pages/characters_detail_page.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/pages/characters_page.dart';
import 'package:demo_real_estate_project/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPage {
  static List<GetPage> list = [
    GetPage(name: AppRoutes.initialRoute, page: CharactersPage.new),
    GetPage(
      name: AppRoutes.characterDetailPage,
      page: CharactersDetailPage.new,
    ),
  ];
}
