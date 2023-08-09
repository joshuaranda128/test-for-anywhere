import 'package:demo_real_estate_project/core/di/injection_container.dart';
import 'package:demo_real_estate_project/entry.dart';
import 'package:demo_real_estate_project/flavor.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await init(flavor: Flavor.simpsons);
  runApp(const Entry());
}
