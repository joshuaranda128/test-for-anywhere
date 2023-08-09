import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoCharacterFound extends StatelessWidget {
  const NoCharacterFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Text('No Characters Available'.tr),
      ),
    );
  }
}
