// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/core/error_config.dart';
import 'package:heystetik_mobileapps/core/state_class.dart';
import 'package:heystetik_mobileapps/models/customer/bank_by_id_model.dart'
    as ByID;
import 'package:heystetik_mobileapps/models/customer/bank_model.dart';
import 'package:heystetik_mobileapps/models/customer/list_bank_model.dart'
    as SELECTLIST;
import 'package:heystetik_mobileapps/service/customer/bank/bank_service.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';

class BankController extends StateClass {
  TextEditingController searchController = TextEditingController();
  RxInt bankId = 0.obs;
  TextEditingController bankName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  Rx<SELECTLIST.ListBankModel> select = SELECTLIST.ListBankModel().obs;
  RxList<SELECTLIST.Data2> filterSelect = List<SELECTLIST.Data2>.empty().obs;

  Rx<BankModel> data = BankModel().obs;
  RxList<Data> filterData = List<Data>.empty().obs;

  Rx<ByID.BankByIdModel> detail = ByID.BankByIdModel().obs;

  Future<SELECTLIST.ListBankModel?> selectListBank(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      select.value = await BankService().selectListBank();

      print(jsonDecode(jsonEncode(data.value)));
      filterSelect.value = select.value.data!.data!;
      print(filterData);
      filterSelect.refresh();
    });
    return select.value;
  }

  onChangeFilterText(String value) {
    filterSelect.value = select.value.data!.data!.where((element) {
      return element.name!.toLowerCase().contains(value.toLowerCase()) ||
          element.code!.toLowerCase().contains(value.toLowerCase());
    }).toList();
  }

  Future<BankModel?> listBank(BuildContext context) async {
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      data.value = await BankService().listBank();

      print(jsonDecode(jsonEncode(data.value)));
      filterData.value = data.value.data!;
      print(filterData);
      filterData.refresh();
    });
    return data.value;
  }

  findBank(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      detail.value = await BankService().findBank(id);
      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }

      bankId.value = detail.value.data!.bankId!;
      bankName.text = detail.value.data?.bank?.name ?? '-';
      name.text = detail.value.data?.name ?? '-';
      accountNumber.text = detail.value.data?.accountNumber ?? '-';
    });
    isLoading.value = false;
  }

  clearForm() {
    bankId.value = 0;
    name.clear();
    bankName.clear();
    accountNumber.clear();
    searchController.clear();
  }

  saveBank(BuildContext context) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (bankId.value == 0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilih bank terlebih dahulu',
        );
      }
      if (accountNumber.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nomor akun harus diisi',
        );
      }

      if (name.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nama harus diisi',
        );
      }

      var req = {
        'bank_id': bankId.value,
        'name': name.text,
        'account_number': accountNumber.text,
      };
      print('req $req');

      detail.value = await BankService().saveBank(req);

      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }

      Get.back();
      Get.back();

      clearForm();
      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Bank berhasil disimpan',
      );
    });
    isLoading.value = false;
  }

  updateBank(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      if (bankId.value == 0) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Pilih bank terlebih dahulu',
        );
      }
      if (accountNumber.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nomor akun harus diisi',
        );
      }

      if (name.text.isEmpty) {
        throw ErrorConfig(
          cause: ErrorConfig.userInput,
          message: 'Nama harus diisi',
        );
      }

      var req = {
        'bank_id': id,
        'name': name.text,
        'account_number': accountNumber.text,
      };
      print('req $req');

      detail.value = await BankService().updateBank(id, req);

      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }

      Get.back();
      Get.back();

      clearForm();
      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Bank berhasil diubah',
      );
    });
    isLoading.value = false;
  }

  deleteBank(BuildContext context, int id) async {
    isLoading.value = true;
    await ErrorConfig.doAndSolveCatchInContext(context, () async {
      Get.back();

      detail.value = await BankService().deleteBank(id);
      if (detail.value.success != true && detail.value.message != 'Success') {
        throw ErrorConfig(
          cause: ErrorConfig.anotherUnknow,
          message: detail.value.message.toString(),
        );
      }
      Get.back();

      SnackbarWidget.getSuccessSnackbar(
        context,
        'Berhasil',
        'Bank berhasil dihapus',
      );
      return;
    });
    isLoading.value = false;
  }
}
