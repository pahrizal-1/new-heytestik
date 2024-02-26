import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/models/doctor/profile_model.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/doctor/profile/profile_controller.dart';
import '../../../core/convert_date.dart';
import '../../../core/global.dart';
import '../../../widget/loading_widget.dart';
import '../../../widget/text_form_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool isSelected = false;
  final DoctorProfileController state = Get.put(DoctorProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.getProfile(context);
    });
  }

  // image fromo galleryo
  Future openGallery() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        state.imagePath = File(pickedImage.path);
        final bytes = File(state.imagePath!.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        state.fileImg64 = "data:/png;base64,$img64";
      });
    } else {
      print("image not selected");
    }
  }

  Future _cropImage() async {
    if (state.profileData != null) {
      CroppedFile? cropped = await ImageCropper()
          .cropImage(sourcePath: state.profileData.string, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ], uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop',
            cropGridColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(title: 'Crop')
      ]);

      if (cropped != null) {
        setState(() {
          state.profileData = File(cropped.path) as Rx<ProfileModel>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromCssColor('#ECECEC'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    state.imagePath = null;
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Ubah Profil',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontWeight: bold,
                    fontSize: 20,
                    color: whiteColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 65,
                          child: CircleAvatar(
                            backgroundImage: state.imagePath != null
                                ? FileImage(File(state.imagePath!.path))
                                : state.profileData.value.data!
                                            .mediaUserProfilePicture !=
                                        null
                                    ? NetworkImage('${Global.FILE}' +
                                        '/' +
                                        state
                                            .profileData
                                            .value
                                            .data!
                                            .mediaUserProfilePicture!
                                            .media!
                                            .path
                                            .toString()) as ImageProvider
                                    : AssetImage('assets/images/doctor1.png'),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            openGallery();
                          },
                          child: Text(
                            'Ubah Foto Profil',
                            style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 13,
                              fontWeight: bold,
                              color: greenColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 17, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Pribadi',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontWeight: bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TetxFromProfilEdit(
                          title1: 'Nama Lengkap',
                          controller: state.nama,
                          icon: Icons.person,
                        ),
                        TetxFromProfilEdit(
                          title1: 'Spesialisasi',
                          controller: state.spesialisasi,
                          icon: Icons.edit,
                        ),
                        TetxFromProfilEdit(
                          title1: 'Email',
                          controller: state.email,
                          icon: Icons.email,
                        ),
                        TetxFromProfilEdit(
                          title1: 'No. Handphone',
                          controller: state.noHp,
                          icon: Icons.call,
                        ),
                        Row(
                          children: [
                            Text(
                              'Jenis Kelamin',
                              style: subTitleTextStyle,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            DropdownButton<String>(
                              value: state.dropdownValue.value,
                              underline: Container(),
                              items: state.items.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          blackTextStyle.copyWith(fontSize: 13),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                state.dropdownValue.value = newValue ?? '';
                                setState(() {});
                              },
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.transparent,
                            )
                          ],
                        ),
                        dividergrey(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 130,
                                  child: Text(
                                    'Tanggal Lahir',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 13,
                                      letterSpacing: 0.5,
                                      color: fromCssColor('#999999'),
                                    ),
                                  ),
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 170),
                                  child: RichText(
                                    text: TextSpan(
                                      text: state.date != null
                                          ? ConvertDate.defaultDate(
                                              state.date.toString())
                                          : '',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        color: fromCssColor('#323232'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () async {
                                final ressult = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));
                                if (ressult != null) {
                                  setState(() {
                                    state.date = ressult;
                                  });
                                }
                              },
                              child: Icon(
                                Icons.date_range_outlined,
                                color: fromCssColor('#999999'),
                                size: 20,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20, left: 20, top: 17, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Pribadi',
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontWeight: bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     SizedBox(
                        //       width: 150,
                        //       child: Text(
                        //         'Nomor SIP',
                        //         style: TextStyle(
                        //           fontFamily: 'ProximaNova',
                        //           fontSize: 13,
                        //           letterSpacing: 0.5,
                        //           color: fromCssColor('#999999'),
                        //         ),
                        //       ),
                        //     ),
                        //     Container(
                        //       constraints: const BoxConstraints(maxWidth: 170),
                        //       child: RichText(
                        //         text: TextSpan(
                        //           text: '123/ABC/456/2022',
                        //           style: TextStyle(
                        //             fontFamily: 'ProximaNova',
                        //             color: fromCssColor('#323232'),
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 13,
                        //           ),
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        TetxFromProfilEdit(
                          title1: 'Nomor SIP',
                          controller: state.nomorsip,
                          icon: Icons.change_circle,
                        ),
                        TetxFromProfilEdit(
                          title1: 'Nomor STR',
                          controller: state.nomorstr,
                          icon: Icons.change_circle,
                        ),
                        TetxFromProfilEdit(
                          title1: 'Pendidikan Akhir',
                          controller: state.pendidikanAkhir,
                          icon: Icons.change_circle,
                        ),
                        TetxFromProfilEdit(
                          title1: 'Tempat Praktek',
                          controller: state.tempatpraktek,
                          icon: Icons.change_circle,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    state.updateProfile(context);
                  },
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Simpan Data',
                        style: TextStyle(
                          color: greenColor,
                          fontFamily: 'ProximaNova',
                          fontSize: 15,
                          letterSpacing: 0.5,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.pop(context);
                    state.postCloseAccount(context);
                  },
                  child: Container(
                    color: Colors.white,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Tutup Akun',
                        style: TextStyle(
                          color: greenColor,
                          fontFamily: 'ProximaNova',
                          fontSize: 15,
                          letterSpacing: 0.5,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
