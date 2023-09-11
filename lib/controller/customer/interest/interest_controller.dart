import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/interest/interest_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

import '../../../core/local_storage.dart';

class InterestController extends StateClass {
  String? skinType;
  String? skinToneColor;
  String? skinUnderToneColor;
  String? hairType;
  String? hairColor;
  bool? hijabers;
  String? skincare;
  String? treatment;
  List<String> _faceCorrective = [];
  List<String> _bodyCorrective = [];
  List<String> _pastTreatment = [];
  List<String> _augmentation = [];

  List<String> get faceCorrective => _faceCorrective;
  List<String> get bodyCorrective => _bodyCorrective;
  List<String> get pasTreatment => _pastTreatment;
  List<String> get augmentation => _augmentation;

  void addFaceCorrective(String value) {
    _faceCorrective.add(value);
    notifyListeners();
  }

  void removeFaceCorrective(String value) {
    _faceCorrective.remove(value);
    notifyListeners();
  }

  void addBodyCorrective(String value) {
    _bodyCorrective.add(value);
    notifyListeners();
  }

  void removeBodyCorrective(String value) {
    _bodyCorrective.remove(value);
    notifyListeners();
  }

  void addPastTreatment(String value) {
    _pastTreatment.add(value);
    notifyListeners();
  }

  void removePastTreatment(String value) {
    _pastTreatment.remove(value);
    notifyListeners();
  }

  void addAugementation(String value) {
    _augmentation.add(value);
    notifyListeners();
  }

  void removeAugmentation(String value) {
    _augmentation.remove(value);
    notifyListeners();
  }

  beautifulProfile(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (skinType == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilihan Tipe Kulit harus diisi',
        );
      }
      if (skinToneColor == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilihan Warna Tone Kulit harus diisi',
        );
      }
      if (skinUnderToneColor == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilihan Warna Undertone Kulit harus diisi',
        );
      }
      if (hairType == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilihan Tipe Rambut harus diisi',
        );
      }
      if (hairColor == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilihan Warna Rambut harus diisi',
        );
      }
      if (hijabers == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilihan Hijaber harus diisi',
        );
      }

      var data = {
        "user_id": await LocalStorage().getUserID(),
        "skin_type": skinType,
        "skin_tone_color": skinToneColor,
        "skin_undertone_color": skinUnderToneColor,
        "hair_type": hairType,
        "hair_color": hairColor,
        "hijabers": hijabers,
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
      if (skincare == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Budget Skincare harus diisi',
        );
      }

      if (treatment == null) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Budget Treatment harus diisi',
        );
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'budget_for_skincare': skincare,
        'budget_for_treatment': treatment,
      };

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
        'lists': augmentation,
      };

      var loginResponse = await InterestService().augmentation(data);
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

      for (int i = 0; i < _pastTreatment.length; i++) {
        listData.add({
          'name_history_treatment': _pastTreatment[i],
        });
      }

      var data = {
        'user_id': await LocalStorage().getUserID(),
        'lists': listData,
      };

      var loginResponse = await InterestService().pastTreatment(data);
      print(loginResponse);
      doInPost();
    });
    isLoading.value = false;
  }
}
