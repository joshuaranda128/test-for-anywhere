import 'package:demo_real_estate_project/core/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: ThemeColors.clrBlack,
      centerTitle: true,
    );
  }
}
