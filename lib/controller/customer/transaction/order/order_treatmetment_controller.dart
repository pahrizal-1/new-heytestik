import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/service/customer/transaction/transaction_service.dart';
import 'package:intl/intl.dart';

class OrderTreatmentController extends StateClass {
  RxString arrivalDate = 'Atur'.obs;
  RxString arrivalTime = ''.obs;

  // RxString arrivalTimeFirst = ''.obs;
  // RxString arrivalTimeLast = ''.obs;
  orderTreatment(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      var reqOrder = {
        "schedule_date": "2023-07-30",
        "schedule_time": "16:00-18:00",
        "treatment_item": [
          {
            "treatment_id": 1,
            "pax": 1,
          }
        ],
        "payment_method": "VIRTUAL_ACCOUNT",
        "payment_type": "BCA"
      };
      print("req order $reqOrder");

      var res = await TransactionService().orderTreatment(reqOrder);

      if (res.success != true && res.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: res.message.toString(),
        );
      }
    });
    isLoading.value = false;
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));

    if (picked != null) {
      arrivalDate.value = picked.toString().split(" ")[0];
    }
  }

  selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
    } else {
      print("Time is not selected");
    }
  }
}
