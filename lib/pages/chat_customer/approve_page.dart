// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/consultation/consultation_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ApprovePage extends StatefulWidget {
  String orderId;
  ApprovePage({required this.orderId, super.key});

  @override
  State<ApprovePage> createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  final ConsultationController state = Get.put(ConsultationController());
  int resentTime = 120;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    state.getUser();
    state.connectSocket(Get.context!);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resentTime == 0) {
        setState(() {
          // state.connectSocket(Get.context!);
          timer.cancel();
        });
      } else {
        setState(() {
          resentTime--;
        });
      }
    });
    // state.startVerifyCountTime();

    // state.initiateChat(context, widget.orderId);
    // state.connectSocket(context);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
            state.close();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 27,
            color: blackColor,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 90, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  border: Border.all(color: greenColor),
                  color: const Color(0xffD9D9D9),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: state.initiate.value?.data?.doctor?.mediaUserProfilePicture != null
                        ? NetworkImage(
                                "${Global.FILE}/${state.initiate.value?.data?.doctor?.mediaUserProfilePicture?.media?.path}")
                            as ImageProvider
                        : AssetImage(
                            'assets/icons/person-white.png',
                          ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                'Sedang menghubungkan dengan dokter ${state.initiate.value!.data!.doctor!.fullname}',
                style: blackRegulerTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Tunggu sebentar ....',
                style: blackTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            state.status.value.isEmpty
                ? SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      color: greenColor,
                    ),
                  )
                : Container(),
            const SizedBox(
              height: 50,
            ),
            Obx(
              () => Text(
                'Halo ${state.username.value}, kami sudah memberitahu dokter tentang permintaan kamu',
                style: blackRegulerTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${resentTime} detik',
              style: grenTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
