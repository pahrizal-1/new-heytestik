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
  TextEditingController searchController = TextEditingController();

  List<String> get faceCorrective => _faceCorrective;
  List<String> get bodyCorrective => _bodyCorrective;
  List<String> get pasTreatment => _pastTreatment;
  List<String> get augmentation => _augmentation;

  List filterTreatment = [];
  List skinGoalTreatment = [
    {'treatment': 'Cryolipolysis', 'checked': false},
    {'treatment': 'Facial', 'checked': false},
    {'treatment': 'Electrocauter', 'checked': false},
    {'treatment': 'Filler', 'checked': false},
    {'treatment': 'HIFU', 'checked': false},
    {'treatment': 'IPL', 'checked': false},
    {'treatment': 'Laser CO2', 'checked': false},
    {'treatment': 'Laser Erbium', 'checked': false},
    {'treatment': 'Laser Pico', 'checked': false},
    {'treatment': 'Laser Nd:YAG', 'checked': false},
    {'treatment': 'Laser Pulsed Dye', 'checked': false},
    {'treatment': 'LED Light Therapy', 'checked': false},
    {'treatment': 'Mesotherapy', 'checked': false},
    {'treatment': 'Microneedling', 'checked': false},
    {'treatment': 'Peeling', 'checked': false},
    {'treatment': 'Mikrodermabrasi', 'checked': false},
    {'treatment': 'Oxygen Facial', 'checked': false},
    {'treatment': 'PRP', 'checked': false},
    {'treatment': 'Radio Frekuensi', 'checked': false},
    {'treatment': 'Skin Booster', 'checked': false},
    {'treatment': 'Subsisi', 'checked': false},
    {'treatment': 'Suntik Botulinum Toxic', 'checked': false},
    {'treatment': 'Suntik DNA Salmon', 'checked': false},
    {'treatment': 'Suntik Jerawat', 'checked': false},
    {'treatment': 'Suntik Keloid', 'checked': false},
    {'treatment': 'Tanam Benang', 'checked': false},
    {'treatment': 'Blepharoplasty', 'checked': false},
    {'treatment': 'Breast Augmentation', 'checked': false},
    {'treatment': 'Buccal Fat Removal', 'checked': false},
    {'treatment': 'Facelift', 'checked': false},
    {'treatment': 'Facial Fat Transfer', 'checked': false},
    {'treatment': 'Rhinoplasty', 'checked': false},
    {'treatment': 'Liposuction', 'checked': false},
    {'treatment': 'Transfer Lemak', 'checked': false},
    {'treatment': 'Tummy Tuck', 'checked': false},
    {'treatment': 'Ekstraksi Komedo', 'checked': false},
    {'treatment': 'Tattoo Removal', 'checked': false},
    {'treatment': 'Cross TCA', 'checked': false},
    {'treatment': 'Suntik Melasma', 'checked': false},
    {'treatment': 'Yellow Laser', 'checked': false},
    {'treatment': 'Injeksi Lipolysis', 'checked': false},
    {'treatment': 'Aspirasi', 'checked': false},
    {'treatment': 'Bedah Plong', 'checked': false},
    {'treatment': 'Bedah Insisi', 'checked': false},
    {'treatment': 'Bedah Eksisi', 'checked': false},
    {'treatment': 'Rhinoplasty', 'checked': false},
  ];

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

  onChangeFilterText(String value) {
    filterTreatment = skinGoalTreatment.where((element) {
      return element.toString().toLowerCase().contains(value.toLowerCase());
    }).toList();
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

      for (int i = 0; i < pasTreatment.length; i++) {
        listData.add({
          'name_history_treatment': pasTreatment[i],
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
