import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/available_voucher_model.dart';

import 'package:heystetik_mobileapps/service/customer/voucher/voucher_service.dart';

class VoucherController extends StateClass {
  Future<List<Data2>> getAvailableVoucherModel(BuildContext context,
      {Map<String, dynamic>? param}) async {
    AvailableVoucherModel? data;
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data = await VoucherService().getAvailableVoucherModel(filter: param);
    });
    isLoading.value = false;
    return data?.data?.data ?? [];
  }

  Future<Data2> findVoucherByCodeModel(
      BuildContext context, String code) async {
    Data2? data;
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (code.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Kode voucher harus diisi',
        );
      }
      data = await VoucherService().findVoucherByCodeModel(code);
    });
    print("data ${jsonDecode(jsonEncode(data))}");
    isLoading.value = false;
    return data!;
  }
}
