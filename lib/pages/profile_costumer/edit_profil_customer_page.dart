import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/tambah_bio_profik_customer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/tambah_username_profil_costomer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_email_customer_profil_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_jenis_kelamin_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_nama_profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_nomor_customer_profil_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_tanggal_lahir_customer_profil_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../core/global.dart';
import '../../widget/button_widget.dart';
import '../../widget/loading_widget.dart';

class EditProfilCostomer extends StatefulWidget {
  const EditProfilCostomer({super.key});

  @override
  State<EditProfilCostomer> createState() => _EditProfilCostomerState();
}

class _EditProfilCostomerState extends State<EditProfilCostomer> {
  final ProfileController state = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.init();
      state.getProfile(context);
    });
    // state.getProfile(context);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTempory = File(image.path);
      setState(() {
        state.image = imageTempory;
        final bytes = imageTempory.readAsBytesSync();
        String img64 = base64Encode(bytes);
        state.fileImg64 = "data:/png;base64,$img64";
        state.isSave.value = true;
      });
      // setState(() => this.state.image = imageTempory);
    } on PlatformException catch (e) {
      print('Failed to pick : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  state.image = null;
                  state.isSave.value = false;
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
                "Ubah Profil",
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    state.image != null
                        ? ClipOval(
                            child: Image.file(
                              state.image!,
                              width: 75,
                              height: 75,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: state.imgNetwork.value != ""
                                    ? NetworkImage(
                                            '${Global.FILE}/${state.imgNetwork.value}')
                                        as ImageProvider
                                    : AssetImage(
                                        'assets/icons/person-white.png',
                                      ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 6,
                    ),
                    InkWell(
                      onTap: () {
                        pickImage();
                      },
                      child: Text(
                        'Ubah Foto Profil',
                        style: grenTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: state.isSave.value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ButtonGreenWidget(
                          title: 'Simpan',
                          onPressed: () {
                            state.updateProfile(context);
                            // state.verifyCode(context);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              dividergrey(),
              Padding(
                padding: lsymetric.copyWith(top: 15, bottom: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Info Profil',
                          style: blackTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(
                          'assets/icons/alert-new.png',
                          width: 20,
                          color: greyColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () async {
                        String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UbahNamaProfilCustomer(),
                          ),
                        );
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'Nama',
                            style: subTitleTextStyle.copyWith(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 82,
                          ),
                          Text(
                            state.name.value,
                            style: blackRegulerTextStyle.copyWith(
                                fontSize: 15, color: blackColor),
                            textAlign: TextAlign.start,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/icons/arrow-left-hight.png',
                            width: 25,
                            color: blackColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () async {
                        String refresh = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TamBahanUserNameProfilCustomer()));
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'Username',
                            style: subTitleTextStyle.copyWith(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 53,
                          ),
                          Text(
                            state.username.value,
                            style: blackRegulerTextStyle.copyWith(fontSize: 15),
                            textAlign: TextAlign.start,
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/icons/arrow-left-hight.png',
                            width: 25,
                            color: blackColor,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () async {
                        String refresh = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TambahBioProfikCustomer()));
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            'Bio',
                            style: subTitleTextStyle.copyWith(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Expanded(
                            child: Text(
                              state.bio.value,
                              style: blackRegulerTextStyle.copyWith(
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/icons/arrow-left-hight.png',
                            width: 25,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const dividergreen(),
              Padding(
                padding: lsymetric.copyWith(top: 17, bottom: 17),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Info Pribadi',
                          style: blackTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Image.asset(
                          'assets/icons/alert-new.png',
                          width: 20,
                          color: greyColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          'User ID',
                          style: subTitleTextStyle.copyWith(fontSize: 15),
                        ),
                        const SizedBox(
                          width: 74,
                        ),
                        Text(
                          state.idUser.value,
                          style: blackRegulerTextStyle.copyWith(
                              fontSize: 15, color: blackColor),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextProfil(
                      onPressed: () async {
                        String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  UbahEmailCostumerProfilPage()
                              // const PilihMetodeVerifikasiProfil(),
                              ),
                        );
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      title2: state.email.value,
                      titlel: 'Email',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextProfil(
                      onPressed: () async {
                        String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UbahNomorCustomerProfilPage(),
                            // const PilihMetodeVerifikasiProfil(),
                          ),
                        );
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      title2: state.noHp.value,
                      titlel: 'Nomor HP',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextProfil(
                      onPressed: () async {
                        String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UbahJenisKelaminProfilPage(),
                          ),
                        );
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      title2: state.gender.value,
                      titlel: 'Jenis Kelamin',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextProfil(
                      onPressed: () async {
                        String refresh = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const UbahTanggalLahirProfilCustomer(),
                          ),
                        );
                        if (refresh == 'refresh') {
                          setState(() {
                            state.getProfile(context);
                          });
                        }
                      },
                      title2: DateFormat('dd-MM-yyyy')
                          .format(DateTime.parse(state.dob.value)),
                      titlel: 'Tanggal Lahir',
                    )
                  ],
                ),
              ),
              dividergrey(),
              const SizedBox(
                height: 17,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialogLogout(
                        title: 'Apakah Kamu yakin ingin menutup akun?',
                        function: () async {
                          await state.closeAccount(context, doInPost: () async {
                            await state.logout(context);
                          });
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Tutup Akun',
                    style: grenTextStyle.copyWith(fontSize: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextProfil extends StatelessWidget {
  final String titlel;
  final String title2;
  final VoidCallback? onPressed;

  const TextProfil({
    super.key,
    required this.titlel,
    required this.title2,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125,
            child: Text(
              titlel,
              style: TextStyle(
                fontFamily: 'ProximaNova',
                fontSize: 15,
                letterSpacing: 0.5,
                color: fromCssColor('#9B9B9B'),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 170),
            child: RichText(
              text: TextSpan(
                text: title2,
                style: TextStyle(
                  fontFamily: 'ProximaNova',
                  color: fromCssColor('#323232'),
                  fontWeight: regular,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/icons/arrow-left-hight.png',
            width: 25,
          )
        ],
      ),
    );
  }
}
