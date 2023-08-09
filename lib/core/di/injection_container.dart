import 'package:demo_real_estate_project/configs/config_simpsons.dart';
import 'package:demo_real_estate_project/configs/config_wire.dart';
import 'package:demo_real_estate_project/core/_shared/presentation/controller/check_internet_controller.dart';
import 'package:demo_real_estate_project/core/di/injects/inject_controllers.dart';
import 'package:demo_real_estate_project/core/di/injects/inject_datasources.dart';
import 'package:demo_real_estate_project/core/di/injects/inject_repositories.dart';
import 'package:demo_real_estate_project/core/di/injects/inject_usecases.dart';
import 'package:demo_real_estate_project/core/services/api_service.dart';
import 'package:demo_real_estate_project/flavor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> init({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Dependency Injection

  /// Configs
  switch (flavor) {
    case Flavor.simpsons:
      {
        configSimpsons();
      }
      break;
    case Flavor.wire:
      {
        configWire();
      }
      break;
  }

  /// services
  Get
    ..put<CheckInternetController>(CheckInternetController(), permanent: true)
    ..put<ApiService>(ApiService(), permanent: true);

  /// Data Sources
  InjectableDataSources.inject();

  /// Repositories
  InjectableRepositories.inject();

  /// Use cases
  InjectableUseCases.inject();

  /// Controllers
  InjectableControllers.inject();
}
