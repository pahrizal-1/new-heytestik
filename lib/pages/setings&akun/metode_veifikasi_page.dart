import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/verifikasi_keamana_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog.dart';

class MetodeVerifikasiPage extends StatefulWidget {
  const MetodeVerifikasiPage({super.key});

  @override
  State<MetodeVerifikasiPage> createState() => _MetodeVerifikasiPageState();
}

class _MetodeVerifikasiPageState extends State<MetodeVerifikasiPage> {
  final ProfileController state = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    state.getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: blackColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
            ],
          ),
        ),
        actions: [
          Image.asset(
            'assets/icons/more-six.png',
            width: 15,
            height: 15,
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pilih Metode Verifikasi',
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Pilih salah satu metode dibawah ini untuk mendapatkan kode verifikasi',
                style: blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 29,
              ),
              InkWell(
                onTap: () {
                  if (state.noHp.value.isNotEmpty) {
                    state.verifyCodeWA(context, state.noHp.value);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifikasiKeamananPage(
                                  noHp: state.noHp.value,
                                )));
                  } else {
                    showDialog(
                      context: Get.context!,
                      builder: (context) => AlertWidget(subtitle: 'Tolong Lengkapi No Telepon Anda Terlebih Dahulu'),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 18, left: 21, bottom: 17),
                  decoration: BoxDecoration(border: Border.all(color: borderColor, width: 0.6), borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/chat-cirkel.png',
                        width: 34,
                        height: 34,
                        color: greenColor,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SMS ke',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            state.noHp.value.isNotEmpty ? state.noHp.value.replaceAll(RegExp(r'.(?=.{10})'), '*') : '****-****-*645',
                            style: subTitleTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              InkWell(
                onTap: () {
                  if (state.email.value.isNotEmpty) {
                    state.verifyCodeEmail(context, state.email.value);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifikasiEmailKeamananAkunPage(
                                  email: state.email.value,
                                )));
                  } else {
                    showDialog(
                      context: Get.context!,
                      builder: (context) => AlertWidget(subtitle: 'Tolong Lengkapi Email Anda Terlebih Dahulu'),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 18, left: 21, bottom: 17),
                  decoration: BoxDecoration(border: Border.all(color: borderColor, width: 0.6), borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/mail.png',
                        width: 32,
                        height: 30,
                        color: greenColor,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-mail ke',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            state.email.value.isNotEmpty ? state.email.value.replaceAll(RegExp(r'.(?=.{10})'), '*') : 'c*******gmail.com',
                            style: subTitleTextStyle.copyWith(fontSize: 15),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
