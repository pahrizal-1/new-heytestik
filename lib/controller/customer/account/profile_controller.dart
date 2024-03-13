// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/completion_model.dart';
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart';
import 'package:heystetik_mobileapps/models/customer/interest_model.dart'
    as Interest;
import 'package:heystetik_mobileapps/models/customer/user_profile_overview_model.dart'
    as Overview;
import 'package:heystetik_mobileapps/models/customer/finished_review_model.dart'
    as Reviews;
import 'package:heystetik_mobileapps/pages/auth/login_page_new.dart';
import 'package:heystetik_mobileapps/pages/auth/pin_lama_customer.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/service/auth/change_password_service.dart';
import 'package:heystetik_mobileapps/service/customer/profile/profile_service.dart';
import 'package:intl/intl.dart';
import 'package:ua_client_hints/ua_client_hints.dart';
import '../../../core/global.dart';
import '../../../models/customer/customer_profile_model.dart';
import '../../../models/stream_home.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends StateClass {
  Rx<Interest.InterestModel> interestData = Interest.InterestModel().obs;
  Rx<CompletionModel> completionData = CompletionModel().obs;
  Rx<int> skinGoalsFaceCorrectiveLength = 0.obs;
  Rx<int> skinGoalsBodyCorrectiveLength = 0.obs;
  Rx<int> skinGoalsAugmentationLength = 0.obs;
  Rx<int> skinGoalsSexuallySkinLength = 0.obs;
  Rx<int> skinGoalsHistoryTreatmentLength = 0.obs;

  RxString fullName = ''.obs;
  RxString name = ''.obs;
  RxString username = ''.obs;
  RxString bio = ''.obs;
  String bioUser = '';
  RxString idUser = ''.obs;
  RxString email = ''.obs;
  RxString noHp = ''.obs;
  RxString dob = ''.obs;
  RxInt age = 0.obs;
  RxString otp = ''.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emailBaruController = TextEditingController();
  TextEditingController nomorHpController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Rx<CustomerProfileModel> profileData = CustomerProfileModel().obs;
  RxInt resendTime = 120.obs;
  Timer? timer;

  List<String> items = [
    'Laki-laki',
    'Perempuan',
  ];
  RxString gender = 'Pilih jenis kelamin'.obs;

  Map dataUser = {};
  File? image;
  String? fileImg64;
  RxBool isSave = false.obs;
  RxString imgNetwork = ''.obs;

  File? idCardPhoto;
  File? facePhoto;
  RxBool isLoadingCam = false.obs;

  RxInt page = 1.obs;
  RxString postType = "ALL".obs;
  RxList<StreamHomeModel> activity = List<StreamHomeModel>.empty().obs;
  RxList<Reviews.Data2> reviews = List<Reviews.Data2>.empty().obs;

  startVerifyCountTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      resendTime.value = resendTime.value - 1;
      if (resendTime.value <= 0) {
        timer.cancel();
      }
    });
  }

  init() async {
    DateTime currentDate = DateTime.now();
    dataUser = await LocalStorage().getDataUser();
    fullName.value = dataUser['fullname'];
    if (dataUser['dob'] != null) {
      age.value = currentDate.year - DateTime.parse(dataUser['dob']).year;
    }
  }

  // timeout(BuildContext context) async {
  //   isLoading.value = true;
  //   await ErrorConfig.doAndSolveCatchInContext(context, () async {
  //     var res = await ProfileService().timeout();
  //     if (res['success'] != true && res['message'] != 'Success') {
  //       throw ErrorConfig(
  //         cause: ErrorConfig.anotherUnknow,
  //         message: res['message'],
  //       );
  //     }
  //   });
  //   isLoading.value = false;
  // }

  Future accountVerification(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (idCardPhoto!.path.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Foto KTP harus diisi',
        );
      }
      if (facePhoto!.path.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Foto wajah harus diisi',
        );
      }
      var data = {
        "idCardPhoto": idCardPhoto?.path,
        "facePhoto": facePhoto?.path
      };
      print("data $data");
      var res = await ProfileService().accountVerification(data);
      print("res $res");
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      idCardPhoto = null;
      facePhoto = null;
      doInPost();
    });
    isLoading.value = false;
  }

  Future getInterest(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await ProfileService().getInterest();
      interestData.value = response;

      skinGoalsFaceCorrectiveLength.value =
          interestData.value.data!.skinGoalsFaceCorrective!.length;

      skinGoalsBodyCorrectiveLength.value =
          interestData.value.data!.skinGoalsBodyCorrective!.length;

      skinGoalsAugmentationLength.value =
          interestData.value.data!.skinGoalsAugmentation!.length;

      skinGoalsSexuallySkinLength.value =
          interestData.value.data!.skinGoalsSexuallyAndSkinDiseases!.length;

      skinGoalsHistoryTreatmentLength.value =
          interestData.value.data!.skinGoalsHistoryTreatment!.length;
    });
    isLoading.value = false;
  }

  Future getCompletion(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await ProfileService().getCompletion();
      completionData.value = response;
    });
    isLoading.value = false;
  }

  Future getProfile(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var response = await ProfileService().getProfileCust();
      profileData.value = response;

      DateTime? tdata;
      if (profileData.value.data!.dob != null) {
        tdata = DateTime.parse(profileData.value.data!.dob ?? '-');
      }

      final DateFormat formatter = DateFormat('yyyy-MM-dd');

      fullName.value = profileData.value.data!.fullname ?? '-';
      name.value = profileData.value.data!.fullname ?? '-';
      username.value = profileData.value.data!.username ?? '-';
      bio.value = profileData.value.data!.bio ?? '-';
      idUser.value = (profileData.value.data!.id ?? '-').toString();
      email.value = profileData.value.data!.email ?? '-';
      noHp.value = profileData.value.data!.noPhone ?? '-';
      gender.value = profileData.value.data!.gender ?? 'Pilih jenis kelamin';
      dob.value = (tdata != null ? formatter.format(tdata) : '');
      imgNetwork.value =
          (profileData.value.data!.mediaUserProfilePicture != null
              ? profileData.value.data!.mediaUserProfilePicture!.media!.path
              : "")!;
      // data text editing
      fullNameController.text = profileData.value.data!.fullname ?? '-';
      usernameController.text = profileData.value.data!.username ?? '-';
      bioController.text = profileData.value.data!.bio ?? '-';
      emailController.text = profileData.value.data!.email ?? '-';
      // nomorHpController.text = profileData.value.data!.noPhone ?? '-';
      dateController.text = (tdata != null ? formatter.format(tdata) : '');
    });
    isLoading.value = false;
  }

  updateName(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "fullname": fullNameController.text,
      };

      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  verifyCodeEmail(
    BuildContext context,
    String text,
  ) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "method": "EMAIL",
        "type": "CHANGE_PASSWORD",
        "user_id": int.parse(idUser.value),
        "email": text,
      };
      print('email ${text}');
      var response = await ProfileService().verifSend(data);
      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
    });
    isLoading.value = false;
  }

  verifyCodeWA(
    BuildContext context,
    String text,
  ) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "method": "WHATSAPP",
        "type": "CHANGE_PASSWORD",
        "user_id": int.parse(idUser.value),
        "no_phone": text,
      };

      var response = await ProfileService().verifSend(data);
      print('kesini ga cok ${response}');
      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
    });
    isLoading.value = false;
  }

  verifyCodePhone(
    BuildContext context,
    String text,
  ) async {
    isLoading.value = true;

    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "method": "WHATSAPP",
        "type": "CHANGE_PHONE_NUMBER",
        "user_id": int.parse(idUser.value),
        "no_phone": text,
      };

      var response = await ProfileService().verifSend(data);
      if (response['success'] != true && response['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: response['message'],
        );
      }
    });
    isLoading.value = false;
  }

  verifyOtpPassword(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'type': "CHANGE_PASSWORD",
        'verification_code': otp.value,
      };

      var loginResponse = await ChangePasswordService().verifyOTP(data);
      Get.to(() => PinPageLamaCustomer());

      if (loginResponse['success'] != true &&
          loginResponse['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: loginResponse['message'],
        );
      }
    });
    isLoading.value = false;
  }

  updateUsername(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "username": usernameController.text,
      };
      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  updateBio(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "bio": bioController.text,
      };
      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  updateEmail(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "email": emailBaruController.text,
        "verification_code": otp.value
      };
      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Navigator.pop(context);
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  updatePhone(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "no_phone": nomorHpController.text,
        "verification_code": otp.value,
      };
      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Navigator.pop(context);
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  updateProfile(BuildContext context) async {
    isLoading.value = true;
    try {
      var response = await dio.Dio().patch(
        Uri.encodeFull(Global.BASE_API + '/profile/user'),
        data: dio.FormData.fromMap({
          'file': await dio.MultipartFile.fromFile(image!.path),
        }),
        options: dio.Options(
          headers: {
            'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
            'User-Agent': await userAgent(),
          },
          validateStatus: (statusCode) {
            debugPrint('status code $statusCode');
            if (statusCode == null) {
              debugPrint('status code null');
              return false;
            }
            debugPrint('status code statusCode >= 200 && statusCode < 300');
            return statusCode >= 200 && statusCode < 300;
          },
        ),
      );
      print('response $response');
      isSave.value = false;
      Navigator.pop(context);
      getProfile(context);
    } catch (e) {
      print('err ${e}');
    }
    isLoading.value = false;
  }

  updateGender(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "gender": gender.value,
      };
      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  updateDob(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        "dob": dateController.text,
      };
      var response = await ProfileService().changeProfile(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        await init();
        Navigator.pop(context, 'refresh');
      }
    });
    isLoading.value = false;
  }

  updatePassword(BuildContext context, String oldpin, String newpin) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var data = {
        'old_password': oldpin,
        'new_password': newpin,
      };
      var response = await ChangePasswordService().changePassword(data);
      if (response['success'] || response['message'] == 'Success') {
        await LocalStorage().setDataUser(dataUser: response['data']);
        Get.off(() => TabBarCustomer());
      }
    });
    isLoading.value = false;
  }

  closeAccount(BuildContext context, {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await ProfileService().closedAccount();
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      doInPost();
    });
    isLoading.value = false;
  }

  logout(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      await LocalStorage().removeAccessToken();
      int userID = await LocalStorage().getUserID() ?? 0;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await FirebaseMessaging.instance.unsubscribeFromTopic('all');
        await FirebaseMessaging.instance
            .unsubscribeFromTopic(userID.toString());
      });

      Get.offAll(() => const LoginPageNew());
    });
  }

  Future<Overview.Data?> getUserOverview(BuildContext context,
      {String? username}) async {
    isLoading.value = true;
    Overview.Data? userOverview;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var user = await LocalStorage().getDataUser();
      var res =
          await ProfileService().getUserOverview(username ?? user['username']);
      userOverview = res.data!;
    });
    isLoading.value = false;
    return userOverview;
  }

  Future<List<StreamHomeModel>> getUserActivityPost(
    BuildContext context,
    int page, {
    String? username,
    String? search,
    String? postType,
  }) async {
    isLoading.value = true;
    List<StreamHomeModel> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var user = await LocalStorage().getDataUser();
      data = await ProfileService().getUserActivityPost(
        page,
        username: username ?? user['username'],
        search: search,
        postType: postType,
      );
    });
    isLoading.value = false;
    return data;
  }

  Future<List<Data2>> getUserActivityReview(BuildContext context, int page,
      {String? username}) async {
    isLoading.value = true;
    FinishedReviewModel userProfileReview;
    List<Data2> data = [];
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var user = await LocalStorage().getDataUser();
      userProfileReview = await ProfileService()
          .getUserActivityReview(page, username ?? user['username']);
      data = userProfileReview.data!.data!;
    });
    isLoading.value = false;
    return data;
  }

  Future<Interest.Data> getInterestUserProfile(BuildContext context,
      {required String username}) async {
    isLoading.value = true;
    Interest.Data? data;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await ProfileService().getInterestUserProfile(username);
    });
    isLoading.value = false;
    return data!;
  }
}
