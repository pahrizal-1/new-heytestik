// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/interest/interest_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:heystetik_mobileapps/models/customer/lookup_skin_goals_model.dart';
import '../../../core/local_storage.dart';

class InterestController extends StateClass {
  RxString skinType = "".obs;
  RxString skinToneColor = "".obs;
  RxString skinUnderToneColor = "".obs;
  RxString hairType = "".obs;
  RxString hairColor = "".obs;
  bool? hijabers;
  String? skincare;
  String? treatment;
  RxList<String> faceCorrective = <String>[].obs;
  RxList<String> bodyCorrective = <String>[].obs;
  RxList<String> pastTreatment = <String>[].obs;
  RxList<String> augmentation = <String>[].obs;
  RxList<String> sexuallySkinDiseases = <String>[].obs;
  TextEditingController searchController = TextEditingController();

  Future<List<Data2>> lookupSkinGoals(
      BuildContext context, String category) async {
    isLoading.value = true;
    RxList<Data2> lookupSkin = List<Data2>.empty().obs;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await InterestService().lookupSkinGoals(category);
      print(jsonDecode(jsonEncode(res)));
      lookupSkin.value = res.data!.data!;
    });
    isLoading.value = false;
    return lookupSkin;
  }

  beautifulProfile(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // if (skinType == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Pilihan Tipe Kulit harus diisi',
      //   );
      // }
      // if (skinToneColor == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Pilihan Warna Tone Kulit harus diisi',
      //   );
      // }
      // if (skinUnderToneColor == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Pilihan Warna Undertone Kulit harus diisi',
      //   );
      // }
      // if (hairType == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Pilihan Tipe Rambut harus diisi',
      //   );
      // }
      // if (hairColor == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Pilihan Warna Rambut harus diisi',
      //   );
      // }
      // if (hijabers == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Pilihan Hijaber harus diisi',
      //   );
      // }

      var data = {
        "user_id": await LocalStorage().getUserID(),
        "skin_type": skinType.value,
        "skin_tone_color": skinToneColor.value,
        "skin_undertone_color": skinUnderToneColor.value,
        "hair_type": hairType.value,
        "hair_color": hairColor.value,
        "hijabers": hijabers ?? false,
      };
      print(data);

      var loginResponse = await InterestService().beautyProfile(data);
      print(loginResponse);
      doInPost();
    });
    isLoading.value = false;
  }

  budgets(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // if (skincare == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Budget Skincare harus diisi',
      //   );
      // }

      // if (treatment == null) {
      //   throw ErrorConfig(
      //     cause: ErrorConfig.userInput,
      //     message: 'Budget Treatment harus diisi',
      //   );
      // }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'budget_for_skincare': skincare ?? '',
        'budget_for_treatment': treatment ?? '',
      };
      print(data);

      var loginResponse = await InterestService().budgets(data);
      print(loginResponse);
      if (loginResponse['success'] == false) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          SnackbarWidget.getErrorSnackbar(
              context, 'Error', loginResponse['message']);
        });
      } else {
        doInPost();
      }
    });
    isLoading.value = false;
  }

  faceCorrectiveGoals(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<Map<String, dynamic>> listData = [];

      print(faceCorrective.length);

      for (int i = 0; i < faceCorrective.length; i++) {
        listData.add({
          'name_face_corrective': faceCorrective[i],
        });
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'lists': listData,
      };

      print(data);

      var loginResponse = await InterestService().faceCorrective(data);
      print(loginResponse);

      doInPost();
    });
    isLoading.value = false;
  }

  bodyCorrectiveGoals(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<Map<String, dynamic>> listData = [];

      for (int i = 0; i < bodyCorrective.length; i++) {
        listData.add({
          'name_body_corrective': bodyCorrective[i],
        });
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'lists': listData,
      };
      print(data);

      var loginResponse = await InterestService().bodyCorrective(data);
      print(loginResponse);

      doInPost();
    });
    isLoading.value = false;
  }

  augmentationSkinGoals(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<Map<String, dynamic>> listData = [];

      for (int i = 0; i < augmentation.length; i++) {
        listData.add({
          'name_augmentation': augmentation[i],
        });
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'lists': listData,
      };
      print(data);

      var loginResponse = await InterestService().augmentation(data);
      print(loginResponse);

      doInPost();
    });
    isLoading.value = false;
  }

  sexuallySkinSkinGoals(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<Map<String, dynamic>> listData = [];
      print(sexuallySkinDiseases);
      for (int i = 0; i < sexuallySkinDiseases.length; i++) {
        listData.add({
          'name': sexuallySkinDiseases[i],
        });
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'lists': listData,
      };
      print(data);
      // return;
      var loginResponse = await InterestService().sexuallySkin(data);
      print(loginResponse);

      doInPost();
    });
    isLoading.value = false;
  }

  pastTreatmentGoals(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      List<Map<String, dynamic>> listData = [];

      for (int i = 0; i < pastTreatment.length; i++) {
        listData.add({
          'name_history_treatment': pastTreatment[i],
        });
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'lists': listData,
      };
      print("data $data");

      var loginResponse = await InterestService().pastTreatment(data);
      print(loginResponse);
      doInPost();
    });
    isLoading.value = false;
  }
}
