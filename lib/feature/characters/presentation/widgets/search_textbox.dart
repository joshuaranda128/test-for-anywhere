import 'package:demo_real_estate_project/core/constants/theme_constants.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/controller/character_data_controller.dart';
import 'package:flutter/material.dart';

class SearchTextBox extends StatelessWidget {
  const SearchTextBox({
    required this.characterDataController,
    required this.margin,
    super.key,
  });

  final CharacterDataController characterDataController;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextField(
        controller: characterDataController.searchController,
        keyboardType: TextInputType.text,
        cursorColor: ThemeColors.clrWhite,
        style: const TextStyle(color: ThemeColors.clrWhite),
        decoration: InputDecoration(
          hintText: 'Search Characters',
          isDense: true,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: ThemeColors.clrWhite,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: ThemeColors.clrWhite,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: ThemeColors.clrWhite.withOpacity(0.15),
          contentPadding: const EdgeInsets.all(16),
        ),
        onChanged: characterDataController.searchGoalQuery,
      ),
    );
  }
}
