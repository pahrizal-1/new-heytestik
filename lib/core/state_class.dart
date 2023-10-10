import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateClass with ChangeNotifier {
  RxBool isLoading = false.obs;
  RxBool isMinorLoading = false.obs;
  RxBool isLoadingMore = false.obs;
  RxBool isLoadingCam = false.obs;
}
