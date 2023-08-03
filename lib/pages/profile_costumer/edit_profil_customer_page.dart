import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/pilih_metode_verifikasi_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/tambah_bio_profik_customer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/tambah_username_profil_costomer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_jenis_kelamin_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_nama_profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_tanggal_lahir_customer_profil_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/alert_dialog_ulasan.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:image_picker/image_picker.dart';

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
    state.init();
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTempory = File(image.path);
      setState(() => this.image = imageTempory);
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
                state.dataUser['fullname'],
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              children: [
                image != null
                    ? ClipOval(
                        child: Image.file(
                          image!,
                          width: 75,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        height: 75,
                        width: 75,
                        decoration: const BoxDecoration(
                          color: Color(0xffD9D9D9),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icons/person-white.png',
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: greenColor,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                              color: whiteColor,
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
                      width: 61,
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const UbahNamaProfilCustomer()));
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
                        state.dataUser['fullname'],
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TamBahanUserNameProfilCustomer()));
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
                        'Buat username yang unik',
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TambahBioProfikCustomer()));
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
                          'Tulis bio tentangmu ',
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
                      '-',
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const PilihMetodeVerifikasiProfil(),
                      ),
                    );
                  },
                  title2: state.dataUser['email'],
                  titlel: 'Email',
                ),
                const SizedBox(
                  height: 12,
                ),
                TextProfil(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const PilihMetodeVerifikasiProfil(),
                      ),
                    );
                  },
                  title2: state.dataUser['no_phone'],
                  titlel: 'Nomor HP',
                ),
                const SizedBox(
                  height: 12,
                ),
                TextProfil(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const UbahJenisKelaminProfilPage(),
                      ),
                    );
                  },
                  title2: state.dataUser['gender'],
                  titlel: 'Jenis Kelamin',
                ),
                const SizedBox(
                  height: 12,
                ),
                TextProfil(
                  title2: '-',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const UbahTanggalLahirProfilCustomer(),
                      ),
                    );
                  },
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
