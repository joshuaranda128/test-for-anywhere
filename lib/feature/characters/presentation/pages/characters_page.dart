import 'package:demo_real_estate_project/core/_shared/presentation/widgets/custom_app_bar.dart';
import 'package:demo_real_estate_project/core/_shared/presentation/widgets/shimmer_list.dart';
import 'package:demo_real_estate_project/core/constants/theme_constants.dart';
import 'package:demo_real_estate_project/core/responsive_ui/responsive_stateless_widget.dart';
import 'package:demo_real_estate_project/feature/characters/domain/methods/methods.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/controller/character_data_controller.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/widgets/character_image.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/widgets/character_item.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/widgets/no_character_found.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/widgets/no_search_character_found.dart';
import 'package:demo_real_estate_project/feature/characters/presentation/widgets/search_textbox.dart';
import 'package:demo_real_estate_project/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharactersPage extends ResponsiveStatelessWidget {
  CharactersPage({super.key});

  final characterDataController = Get.find<CharacterDataController>();

  @override
  Widget? buildMediumUI(BuildContext context) {
    return buildTabletUI(context);
  }

  @override
  Widget? buildCompactUI(BuildContext context) {
    return buildMobileUI(context);
  }

  Widget buildMobileUI(BuildContext context) {
    return Obx(() {
      if (characterDataController.isShowShimmer.value) {
        return const ShimmerList();
      }

      return Scaffold(
        backgroundColor: ThemeColors.clrDarkGrey,
        appBar: CustomAppBar(
          title: Text(characterDataController.header.value),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            color: ThemeColors.clrTransparent,
            child: Column(
              children: [
                SearchTextBox(
                  characterDataController: characterDataController,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
                if (characterDataController.finalCharacterList.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          characterDataController.finalCharacterList.length,
                      itemBuilder: (_, index) {
                        final character =
                            characterDataController.finalCharacterList[index];
                        return CharacterItem(
                          characterName: getCharacterName(character.text!),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Get.toNamed(
                              AppRoutes.characterDetailPage,
                              arguments: character,
                            );
                          },
                        );
                      },
                    ),
                  )
                else
                  characterDataController.isSearchStart.value
                      ? const NoSearchCharacterFound()
                      : const NoCharacterFound(),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildTabletUI(BuildContext context) {
    return Obx(() {
      if (characterDataController.isShowShimmer.value) {
        return const ShimmerList();
      }

      return SafeArea(
        child: Scaffold(
          backgroundColor: ThemeColors.clrDarkGrey,
          appBar: CustomAppBar(
            title: Text(characterDataController.header.value),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: ThemeColors.clrTransparent,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SearchTextBox(
                          characterDataController: characterDataController,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                        if (characterDataController
                            .finalCharacterList.isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              itemCount: characterDataController
                                  .finalCharacterList.length,
                              itemBuilder: (_, index) {
                                final character = characterDataController
                                    .finalCharacterList[index];
                                return CharacterItem(
                                  characterName:
                                      getCharacterName(character.text!),
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    characterDataController.character.value =
                                        character;
                                  },
                                );
                              },
                            ),
                          )
                        else
                          characterDataController.isSearchStart.value
                              ? const NoSearchCharacterFound()
                              : const NoCharacterFound(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: (characterDataController
                            .finalCharacterList.isNotEmpty)
                        ? ListView(
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                getCharacterName(
                                  characterDataController.character.value.text!,
                                ),
                                style: const TextStyle(
                                  color: ThemeColors.clrWhite,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CharactersImage(
                                image: characterDataController
                                    .character.value.icon!.url,
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 25),
                                child: Text(
                                  characterDataController.character.value.text!,
                                  style: const TextStyle(
                                    color: ThemeColors.clrWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
