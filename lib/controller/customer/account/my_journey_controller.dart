// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/interest_conditions_model.dart'
    as Interest;
import 'package:heystetik_mobileapps/models/customer/my_journey_by_id_model.dart'
    as MyJourneyById;
import 'package:heystetik_mobileapps/models/customer/my_journey_history_consultation_doctor_note_model.dart'
    as HistoryConsultationDoctorNote;
import 'package:heystetik_mobileapps/models/customer/my_journey_model.dart'
    as MyJourney;
import 'package:heystetik_mobileapps/models/customer/my_journey_schedule_treatment_model.dart'
    as ScheduleTreatment;
import 'package:heystetik_mobileapps/models/customer/my_journey_history_consultation_model.dart'
    as HistoryConsultation;
import 'package:heystetik_mobileapps/service/customer/interest_conditions/interest_conditions_service.dart';
import 'package:heystetik_mobileapps/service/customer/my_journey/my_journey_service.dart';
import 'package:image_picker/image_picker.dart';

class MyJourneyController extends StateClass {
  Rx<MyJourney.MyJourneyModel> responseJourney = MyJourney.MyJourneyModel().obs;
  RxList<MyJourney.Data2> dataJourney =
      List<MyJourney.Data2>.empty(growable: true).obs;

  Rx<MyJourneyById.Data> myJourneyById = MyJourneyById.Data.fromJson({}).obs;
  RxInt totalMyJourneyById = 0.obs;

  Rx<HistoryConsultation.MyJourneyHistoryConsultationModel>
      responseHistoryConsultation =
      HistoryConsultation.MyJourneyHistoryConsultationModel().obs;
  RxList<HistoryConsultation.Data2> dataHistoryConsultation =
      List<HistoryConsultation.Data2>.empty(growable: true).obs;

  Rx<HistoryConsultationDoctorNote.Data> historyConsultationDoctorNote =
      HistoryConsultationDoctorNote.Data.fromJson({}).obs;
  var dataUser;
  RxString fullName = ''.obs;
  RxString phone = ''.obs;

  Rx<ScheduleTreatment.MyJourneyScheduleTreatmentModel>
      responseScheduleTreatment =
      ScheduleTreatment.MyJourneyScheduleTreatmentModel().obs;
  RxList<ScheduleTreatment.Data2> dataScheduleTreatment =
      List<ScheduleTreatment.Data2>.empty(growable: true).obs;

  TextEditingController searchController = TextEditingController();
  Rx<Interest.InterestConditionsModel> data =
      Interest.InterestConditionsModel(data: []).obs;
  RxList<Interest.Data> filterData = List<Interest.Data>.empty().obs;
  RxString concern = "".obs;
  RxInt concernId = 0.obs;
  RxBool isGallery = false.obs;
  File? initialConditionFrontFace;
  File? initialConditionRightSide;
  File? initialConditionLeftSide;
  File? initialConditionProblemPart;

  Future<List<MyJourney.Data2>> getJourney(
      BuildContext context, int page) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseJourney.value = await MyJourneysService().getJourney(page);
      dataJourney.value = responseJourney.value.data!.data!;
      print(dataJourney.length);
    });
    isLoading.value = false;
    return dataJourney;
  }

  Future<List<HistoryConsultation.Data2>> getHistoryConsultation(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseHistoryConsultation.value =
          await MyJourneysService().getHistoryConsultation();
      dataHistoryConsultation.value =
          responseHistoryConsultation.value.data!.data!;
    });

    return dataHistoryConsultation;
  }

  getHistoryConsultationDoctorNote(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
        dataUser = await LocalStorage().getDataUser();
        fullName.value = dataUser['fullname'];
        phone.value = dataUser['no_phone'];
        HistoryConsultationDoctorNote
                .MyJourneyHistoryConsultationDoctorNoteModel res =
            await MyJourneysService().getHistoryConsultationDoctorNote(id);
        historyConsultationDoctorNote.value = res.data!;
      } catch (e) {
        print('hehehehe $e');
      }
    });
    isLoading.value = false;
  }

  Future<List<ScheduleTreatment.Data2>> getScheduleTreatment(
      BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseScheduleTreatment.value =
          await MyJourneysService().getScheduleTreatment();
      dataScheduleTreatment.value = responseScheduleTreatment.value.data!.data!;
      print(dataScheduleTreatment.length);
    });

    return dataScheduleTreatment;
  }

  getInterestConditions(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await InterestConditionsService().getInterestConditions();
      filterData.value = data.value.data!;
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = data.value.data!
        .where((element) =>
            element.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  Future pickImageFromGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage == null) {
      return null;
    }

    print(File(returnedImage.path));
    return File(returnedImage.path);
  }

  Future saveJourney(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // try {
      if (concernId.value == 0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilih Skinn Goal terlebih dahulu',
        );
      }
      var data = {
        "concern_id": concernId.value,
        "initial_condition_front_face": initialConditionFrontFace?.path,
        "initial_condition_right_side": initialConditionRightSide?.path,
        "initial_condition_left_side": initialConditionLeftSide?.path,
        "initial_condition_problem_part": initialConditionProblemPart?.path
      };

      print("data $data");

      var res = await MyJourneysService().saveJourney(data);
      print("data $data");
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      print("heheh");
      concernId.value = 0;
      initialConditionFrontFace = null;
      initialConditionRightSide = null;
      initialConditionLeftSide = null;
      initialConditionProblemPart = null;
      print("hahah");
      doInPost();
      // } catch (e) {
      //   print("heheh $e");
      // }
    });
    isLoading.value = false;
  }

  Future detailJourney(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      totalMyJourneyById.value = 0;

      MyJourneyById.MyJourneyByIdModel res =
          await MyJourneysService().detailJourney(id);
      print("=============");
      myJourneyById.value = res.data!;
      print(myJourneyById.value);
      print("=============");
      totalMyJourneyById.value = res.data!.mediaMyJourneys!.length;

      print("=============");
      print(res.data!.mediaMyJourneys!.length);
      print("=============");
      print(totalMyJourneyById.value);
    });
    isLoading.value = false;
  }

  Future deleteJourney(BuildContext context, int id,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      print("id $id");
      var res = await MyJourneysService().deleteJourney(id);
      print("res $res");
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

  Future afterCondition(BuildContext context, int id,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      // try {

      var data = {
        "initial_condition_front_face": initialConditionFrontFace?.path,
        "initial_condition_right_side": initialConditionRightSide?.path,
        "initial_condition_left_side": initialConditionLeftSide?.path,
        "initial_condition_problem_part": initialConditionProblemPart?.path
      };

      print("data $data");

      var res = await MyJourneysService().afterCondition(id, data);
      print("data $data");
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }
      print("heheh");
      concernId.value = 0;
      initialConditionFrontFace = null;
      initialConditionRightSide = null;
      initialConditionLeftSide = null;
      initialConditionProblemPart = null;
      print("hahah");
      doInPost();
      // } catch (e) {
      //   print("heheh $e");
      // }
    });
    isLoading.value = false;
  }
}
