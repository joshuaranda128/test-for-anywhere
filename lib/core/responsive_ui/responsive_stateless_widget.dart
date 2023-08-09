import 'package:demo_real_estate_project/core/responsive_ui/responsive_wrapper.dart';
import 'package:flutter/material.dart';

abstract class ResponsiveStatelessWidget extends StatelessWidget {
  const ResponsiveStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _getScreenSpecificWidget(context) ??
      buildMediumUI(context) ??
      buildCompactUI(context) ??
      emptyWidget();

  Widget? buildMediumUI(BuildContext context) => null;

  Widget? buildCompactUI(BuildContext context) => null;

  Widget emptyWidget() => Container(
        alignment: Alignment.center,
        child: const Text("no Ui Found For This Element"),
      );

  Widget? _getScreenSpecificWidget(BuildContext context) =>
      ResponsiveWrapper.of(context).isTablet
          ? buildMediumUI(context)
          : ResponsiveWrapper.of(context).isMobile
              ? buildCompactUI(context)
              : null;
}
