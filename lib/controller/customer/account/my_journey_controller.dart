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
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseHistoryConsultation.value =
          await MyJourneysService().getHistoryConsultation();
      dataHistoryConsultation.value =
          responseHistoryConsultation.value.data!.data!;
    });
    // isLoading.value = false;
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
    // isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      responseScheduleTreatment.value =
          await MyJourneysService().getScheduleTreatment();
      dataScheduleTreatment.value = responseScheduleTreatment.value.data!.data!;
      print(dataScheduleTreatment.length);
    });
    // isLoading.value = false;
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

  Future saveJourney(BuildContext context,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
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
      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      concernId.value = 0;
      initialConditionFrontFace = null;
      initialConditionRightSide = null;
      initialConditionLeftSide = null;
      initialConditionProblemPart = null;
      doInPost();
    });
    isLoading.value = false;
  }

  Future detailJourney(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      try {
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

        for (int i = 0; i < totalMyJourneyById.value; i++) {
          if (myJourneyById.value.mediaMyJourneys?[i].category ==
              'INITIAL_CONDITION') {
            print('ada INITIAL_CONDITION ${i + 1}');
            print(myJourneyById.value.mediaMyJourneys?[i].media?.path);
          }

          if (myJourneyById.value.mediaMyJourneys?[i].category ==
              'AFTER_CONDITION') {
            print('ada AFTER_CONDITION ${i + 1}');

            print(myJourneyById.value.mediaMyJourneys?[i].media?.path);
          }
        }
      } catch (e) {
        print("eheheh $e");
      }
    });
    isLoading.value = false;
  }
}
