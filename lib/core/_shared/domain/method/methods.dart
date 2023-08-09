import 'package:demo_real_estate_project/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

/// PreLoading the Images into the system cache
void preLoadImages(BuildContext context) {
  for (final image in ImageConstants.imageList) {
    precacheImage(AssetImage(image), context);
  }
}
