import 'package:demo_real_estate_project/core/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class NoSearchCharacterFound extends StatelessWidget {
  const NoSearchCharacterFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      decoration: BoxDecoration(
        color: ThemeColors.clrWhite,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.clrBlack.withOpacity(0.15),
            blurRadius: 21,
            offset: const Offset(0, 21), // changes position of shadow
          ),
        ],
      ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off_outlined, size: 50),
          SizedBox(height: 15),
          Text(
            'No Characters Found',
            style: TextStyle(
              color: ThemeColors.clrBlack50,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
