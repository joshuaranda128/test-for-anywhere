import 'package:demo_real_estate_project/core/_shared/domain/usecases/usecase.dart';
import 'package:demo_real_estate_project/feature/characters/domain/entity/character_data.dart';
import 'package:demo_real_estate_project/feature/characters/domain/usecases/fetch_character_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterDataController extends GetxController {
  CharacterDataController({required this.fetchCharacterDataUC});

  final FetchCharacterDataUC fetchCharacterDataUC;

  RxBool isShowShimmer = true.obs;
  RxBool isSearchStart = false.obs;
  RxString header = "".obs;
  RxList<Character> characterList = <Character>[].obs;
  RxList<Character> finalCharacterList = <Character>[].obs;
  Rx<Character> character = Character().obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 500), fetchCharacterData);
  }

  Future<void> fetchCharacterData() async {
    isShowShimmer.value = true;
    Future.delayed(
      const Duration(milliseconds: 500),
      () async {
        final fetchDataFailedOrSuccess = await fetchCharacterDataUC(NoParams());
        await fetchDataFailedOrSuccess.fold(
          (left) {
            isShowShimmer.value = false;
          },
          (right) async {
            isShowShimmer.value = false;
            header.value = right.header!;
            characterList.value = right.characterList!;
            character.value = characterList[0];
            getFinalList();
          },
        );
      },
    );
  }

  void getFinalList({List<Character>? list}) {
    finalCharacterList.clear();
    if (list != null) {
      finalCharacterList.addAll(list);
    } else {
      finalCharacterList.addAll(characterList);
    }
  }

  void searchGoalQuery(String value) {
    isSearchStart.value = true;
    final dummySearchCharacterList = <Character>[...characterList];
    if (value.isNotEmpty) {
      final dummyCharacterList = <Character>[];
      for (final element in dummySearchCharacterList) {
        if (element.text!.toLowerCase().contains(value.toLowerCase()) ||
            element.text!.toLowerCase().startsWith(value.toLowerCase())) {
          dummyCharacterList.add(element);
        }
      }
      getFinalList(list: dummyCharacterList);
    } else {
      isSearchStart.value = false;
      getFinalList();
    }
  }
}
