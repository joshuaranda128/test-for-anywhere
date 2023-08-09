import 'package:demo_real_estate_project/core/_shared/domain/method/methods.dart';
import 'package:demo_real_estate_project/core/constants/string_constants.dart';
import 'package:demo_real_estate_project/routes/app_page.dart';
import 'package:demo_real_estate_project/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Entry extends StatelessWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    preLoadImages(context);
    return GetMaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: false,
      getPages: AppPage.list,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
