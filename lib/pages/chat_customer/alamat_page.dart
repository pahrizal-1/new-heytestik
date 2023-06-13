import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/text_form_widget.dart';

class Alamatpage extends StatefulWidget {
  const Alamatpage({super.key});

  @override
  State<Alamatpage> createState() => _AlamatpageState();
}

class _AlamatpageState extends State<Alamatpage> {
  final TextEditingController _controller = TextEditingController(
      text: 'Kebayoran Lama, Jakarta Selatan, DKI Jakarta');
  bool _isEnable = false;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: greenColor,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              'Alamat',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Penerima',
                style: blackHigtTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 14,
              ),
              const InfomasiTextFrom(
                title: 'Nama Lengkap*',
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    labelText: 'Nomer Hp Penerima*',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 10),
                      child: Text(
                        '+62',
                        style: blackHigtTextStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    labelStyle: subTitleTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Informasi Penerima',
                style: blackHigtTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'Pinpoint',
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/maps11.svg',
                      width: 20,
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 200),
                      child: Text(
                        'Kebayoran Lama, Jakarta Selatan, DKI Jakarta',
                        style: blackRegulerTextStyle,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isEnable = _isEnable;
                          isSelected = !isSelected;
                        });
                      },
                      child: isSelected
                          ? Text('Simpan',
                              style: grenTextStyle.copyWith(fontSize: 14))
                          : Text(
                              'Ubah',
                              style: grenTextStyle.copyWith(fontSize: 14),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                child: TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    labelText: 'Label Alamat',
                    labelStyle: subTitleTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 101,
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    labelText: 'Label Alamat',
                    labelStyle: subTitleTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              SizedBox(
                height: 60,
                child: TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    labelText: 'Label Alamat',
                    labelStyle: subTitleTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ButtonGreenWidget(title: 'Simpan'),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
