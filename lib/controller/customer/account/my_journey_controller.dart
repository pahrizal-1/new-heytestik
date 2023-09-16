// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/concern_model.dart'
    as Concern;
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
import 'package:heystetik_mobileapps/service/customer/my_journey/my_journey_service.dart';
import 'package:heystetik_mobileapps/service/customer/solution/solution_service.dart';
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
  RxString fullName = '-'.obs;
  RxString phone = ''.obs;
  RxInt age = 0.obs;
  RxBool doctorNote = false.obs;

  Rx<ScheduleTreatment.MyJourneyScheduleTreatmentModel>
      responseScheduleTreatment =
      ScheduleTreatment.MyJourneyScheduleTreatmentModel().obs;
  RxList<ScheduleTreatment.Data2> dataScheduleTreatment =
      List<ScheduleTreatment.Data2>.empty(growable: true).obs;

  TextEditingController searchController = TextEditingController();

  Rx<Concern.ConcernModel?> data = Concern.ConcernModel.fromJson({}).obs;
  RxList<Concern.Data2> filterData = List<Concern.Data2>.empty().obs;

  RxString concern = "".obs;
  RxInt concernId = 0.obs;
  RxBool isGallery = false.obs;
  File? initialConditionFrontFace;
  File? initialConditionRightSide;
  File? initialConditionLeftSide;
  File? initialConditionProblemPart;

  RxBool isLoadingCam = false.obs;
  RxBool isAfter = true.obs;

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
      DateTime currentDate = DateTime.now();

      dataUser = await LocalStorage().getDataUser();
      fullName.value = dataUser['fullname'];
      phone.value = dataUser['no_phone'];

      if (dataUser['dob'] != null) {
        age.value = currentDate.year - DateTime.parse(dataUser['dob']).year;
      }

      var res = await MyJourneysService().getHistoryConsultationDoctorNote(id);
      print('rescdata ${jsonDecode(jsonEncode(res.data))}');

      if (res.data == null) {
        print('null euyyy');
        doctorNote.value = false;
        return;
      }

      historyConsultationDoctorNote.value = res.data!;
      doctorNote.value = true;
      print('res ${jsonDecode(jsonEncode(res))}');
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

  getConcern(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await SolutionService().getConcern();
      filterData.value.addAll(data.value!.data!.data!);
    });
    isLoading.value = false;
  }

  onChangeFilterText(String value) {
    filterData.value = data.value!.data!.data!
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

      concernId.value = 0;
      concern.value = "";
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
      totalMyJourneyById.value = 0;
      var res = await MyJourneysService().detailJourney(id);
      print(jsonDecode(jsonEncode(res)));
      if (res.data == null) {
        print("BUAT BARU");
        isAfter.value = false;
      } else {
        isAfter.value = true;
        print("PATCH BARU");
      }
      myJourneyById.value = res.data!;
      totalMyJourneyById.value = res.data!.journey!.length;
    });
    isLoading.value = false;
  }

  Future deleteJourney(BuildContext context, int id,
      {required Function() doInPost}) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var res = await MyJourneysService().deleteJourney(id);

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
      var data = {
        "after_condition_front_face": initialConditionFrontFace?.path,
        "after_condition_right_side": initialConditionRightSide?.path,
        "after_condition_left_side": initialConditionLeftSide?.path,
        "after_condition_problem_part": initialConditionProblemPart?.path
      };

      var res = await MyJourneysService().afterCondition(id, data);

      if (res['success'] != true && res['message'] != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res['message'],
        );
      }

      concernId.value = 0;
      concern.value = "";
      initialConditionFrontFace = null;
      initialConditionRightSide = null;
      initialConditionLeftSide = null;
      initialConditionProblemPart = null;

      doInPost();
    });
    isLoading.value = false;
  }
}
