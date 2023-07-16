import 'dart:io';

import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/auth/beauty_profile_page.dart';
import 'package:heystetik_mobileapps/widget/drop_dow_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../controller/customer/register/register_controller.dart';
import '../../theme/theme.dart';
import '../../widget/alert_dialog.dart';
import '../../widget/button_widget.dart';
import '../../widget/timeline_widget.dart';

class InfoPersonalPage extends StatefulWidget {
  const InfoPersonalPage({super.key});

  @override
  State<InfoPersonalPage> createState() => _InfoPersonalPageState();
}

class _InfoPersonalPageState extends State<InfoPersonalPage> {
  bool _isGender = true;
  File? imagePath;

  @override
  void initState() {
    super.initState();
    _isGender =
        Provider.of<RegisterController>(context, listen: false).gender ==
            "Laki-laki";
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: "assets/images/iphone1.png",
                  width: 18,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 30,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Info Personal',
                  img: "assets/images/iphone1.png",
                  width: 20,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: true,
                  isLast: true,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: true,
                  isLast: true,
                  title: 'Beauty Concern',
                  img: 'assets/icons/logo-person.png',
                  width: 25,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0XffCCCCCC),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 23,
                  ),
                  Text(
                    'Info Personal',
                    style: blackHigtTextStyle,
                  ),
                  const SizedBox(
                    height: 31,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          File imageFile = File(image.path);
                          imagePath = imageFile;
                          setState(() {});
                        }
                      },
                      child: imagePath != null
                          ? Container(
                              height: 83,
                              width: 83,
                              decoration: const BoxDecoration(
                                color: Color(0xffD9D9D9),
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(83),
                                child: Image.file(
                                  imagePath!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          : Container(
                              height: 83,
                              width: 83,
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
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: greenColor,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 24,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _isGender = true;
                              state.gender = "Laki-laki";
                            });
                          },
                          child: Container(
                            height: 40,
                            // width: MediaQuery.of(context).size.width,
                            decoration: _isGender
                                ? BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(7),
                                  )
                                : BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(color: greyColor),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                            child: Center(
                              child: Text('Laki - laki',
                                  style: _isGender
                                      ? TextStyle(
                                          color: whiteColor, fontSize: 12)
                                      : blackTextStyle),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _isGender = false;
                              state.gender = "Perempuan";
                            });
                          },
                          child: Container(
                            height: 40,
                            // width: MediaQuery.of(context).size.width,
                            decoration: _isGender
                                ? BoxDecoration(
                                    color: whiteColor,
                                    border: Border.all(color: greyColor),
                                    borderRadius: BorderRadius.circular(7),
                                  )
                                : BoxDecoration(
                                    color: greenColor,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                            child: Center(
                              child: Text(
                                'Perempuan',
                                style: _isGender
                                    ? blackTextStyle
                                    : TextStyle(
                                        color: whiteColor, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Text(
                    'Nama Lengkap',
                    style: blackTextStyle,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: whiteColor,
                      border: Border.all(color: Color(0xffCCCCCC), width: 1),
                    ),
                    child: Text(
                      state.fullName.text,
                      style: blackTextStyle.copyWith(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const DropDownProvinsiWiget(),
                  const SizedBox(
                    height: 10,
                  ),
                  const DropDownkotaWiget(),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonGreenWidget(
                    title: 'Verifikasi Sekarang',
                    onPressed: () async {
                      if (state.province == 0 || state.city == 0) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertWidget(
                              subtitle:
                                  "Data Provinsi Dan Kota/Kabupaten Harap Diisi"),
                        );
                      } else {
                        await state.register(context, doInPost: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BeautyProfilPage(),
                            ),
                          );
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonTextWidget(
                    title: 'Nanti Saja',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BeautyProfilPage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
