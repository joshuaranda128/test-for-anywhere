import 'package:demo_real_estate_project/core/_shared/presentation/widgets/custom_app_bar.dart';
import 'package:demo_real_estate_project/core/constants/theme_constants.dart';
import 'package:demo_real_estate_project/core/utils/library/flutter_shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.clrDarkGrey,
      appBar: const CustomAppBar(title: Text("")),
      body: SafeArea(
        child: ListView.separated(
          itemCount: 15,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          itemBuilder: (_, __) {
            return Shimmer.fromColors(
              baseColor: ThemeColors.clrGrey300,
              highlightColor: ThemeColors.clrGrey100,
              period: const Duration(seconds: 2),
              child: Container(
                height: 30,
                width: 100,
                decoration: const BoxDecoration(color: ThemeColors.clrWhite),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
