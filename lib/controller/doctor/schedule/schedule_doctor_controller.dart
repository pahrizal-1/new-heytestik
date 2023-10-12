

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';

class ScheduleDoctorController extends StateClass {
  List<TextEditingController> scheduleDateController = []; 
  RxInt jam = 0.obs;
  RxInt menit = 0.obs;
}