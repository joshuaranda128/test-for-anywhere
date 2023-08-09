import 'package:flutter/material.dart';

class ResponsiveWrapper {
  ResponsiveWrapper.of(this.context);

  final BuildContext context;

  bool get isMobile => MediaQuery.of(context).size.width < 480;

  bool get isTablet =>
      MediaQuery.of(context).size.width > 480 &&
      MediaQuery.of(context).size.width < 1000;
}
