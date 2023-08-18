import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../theme/theme.dart';

class UbahJenisKelaminProfilPage extends StatefulWidget {
  const UbahJenisKelaminProfilPage({super.key});

  @override
  State<UbahJenisKelaminProfilPage> createState() =>
      _UbahJenisKelaminProfilPageState();
}

class _UbahJenisKelaminProfilPageState
    extends State<UbahJenisKelaminProfilPage> {
  int isSelected = 0;
  final ProfileController state = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getProfile(context);
    });
    // state.getProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
              Text(
                'Jenis Kelamin',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
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
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pilih Jenis Kelamin',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Jenis kelamin hanya dapat diatur sekali',
                style: blackRegulerTextStyle.copyWith(fontSize: 13),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 88.5),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 0;
                          state.gender.value = 'Laki-laki';
                        });
                      },
                      child: Container(
                        height: 97.2,
                        width: 66,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              state.gender.value == 'Laki-laki'
                                  ? 'assets/icons/gender-laki-laki-green.png'
                                  : 'assets/icons/gender-laki-laki.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 73,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = 1;
                          state.gender.value = 'Perempuan';
                        });
                      },
                      child: Container(
                        height: 97.2,
                        width: 75.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(state.gender.value ==
                                        'Perempuan'
                                    ? 'assets/icons/gender-perempuan-green.png'
                                    : 'assets/icons/gender-perempuan.png'))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 63,
              ),
              Padding(
                padding: lsymetric,
                child: ButtonGreenWidget(
                  onPressed: (){
                    state.updateGender(context);
                  },
                  title: 'Simpan',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
