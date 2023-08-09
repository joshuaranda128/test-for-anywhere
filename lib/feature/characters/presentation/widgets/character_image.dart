import 'package:demo_real_estate_project/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class CharactersImage extends StatelessWidget {
  const CharactersImage({this.image, super.key});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: image != null && image!.isNotEmpty
          ? Image.network(
              image!,
              height: 350,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  height: 350,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              },
              width: double.maxFinite,
              fit: BoxFit.contain,
            )
          : Image.asset(
              ImageConstants.imgDummy,
              height: 350,
              width: double.maxFinite,
              fit: BoxFit.contain,
            ),
    );
  }
}
