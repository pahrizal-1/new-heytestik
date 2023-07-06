import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_alamat_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/keamanan_akun_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/rekening_bank_settings_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../theme/theme.dart';

class SetingsAkunPage extends StatefulWidget {
  const SetingsAkunPage({super.key});

  @override
  State<SetingsAkunPage> createState() => _SetingsAkunPageState();
}

class _SetingsAkunPageState extends State<SetingsAkunPage> {
  bool isSwitch = false;
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
              Expanded(
                child: Text(
                  'Akun Saya',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AkunHomePage()));
            },
            child: SvgPicture.asset(
              'assets/icons/humberger-icons.svg',
            ),
          ),
          const SizedBox(
            width: 26,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 10, bottom: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengaturan Akun',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                ListTitleAkun(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarAlamatPage()));
                  },
                  iconUrl: 'assets/icons/map-icons.png',
                  title: 'Daftar Alamat',
                  title1: 'Atur alamat pengiriman belanjaan',
                ),
                const SizedBox(
                  height: 25,
                ),
                ListTitleAkun(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const RekeningBankSettings()));
                  },
                  iconUrl: 'assets/icons/credit-card.png',
                  title: 'Rekening Bank',
                  title1: 'Tarik Saldo Heystetik ke rekening tujuan',
                ),
                const SizedBox(
                  height: 25,
                ),
                ListTitleAkun(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KeamananAkunPage()));
                  },
                  iconUrl: 'assets/icons/lock-icons.png',
                  title: 'Keamanan Akun',
                  title1: 'Kata sandi, PIN, dan verifikasi data diri',
                ),
                const SizedBox(
                  height: 25,
                ),
                const ListTitleAkun(
                  iconUrl: 'assets/icons/notification-logo-blak.png',
                  title: 'Notifikasi',
                  title1: 'Atur segala jenis pesan notifikasi',
                ),
                const SizedBox(
                  height: 25,
                ),
                const ListTitleAkun(
                  iconUrl: 'assets/icons/privasi-akun-logo.png',
                  title: 'Notifikasi',
                  title1: 'Atur penggunaan data & akun yang tersambung',
                ),
              ],
            ),
          ),
          const dividergreen(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengaturan Aplikasi',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    const ListTitleAkun(
                      iconUrl: 'assets/icons/map_black.png',
                      title: 'Geolokasi',
                      title1: 'Atur rekomendasi berdasarkan lokasi',
                    ),
                    const Spacer(),
                    Switch(
                      focusColor: greenColor,
                      activeColor: greenColor,
                      value: isSwitch,
                      onChanged: (value) {
                        setState(() {
                          isSwitch = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const ListTitleAkun(
                  iconUrl: 'assets/icons/bersihkan-icons.png',
                  title: 'Bersihkan Cache',
                  title1: 'Solusi cepat untuk atasi masalah aplikasi',
                ),
                const SizedBox(
                  height: 24,
                ),
                const dividergreen(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/log-out-icons.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Keluar Akun',
                          style: blackTextStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListTitleAkun extends StatelessWidget {
  final String title;
  final String title1;
  final String iconUrl;
  final VoidCallback? onTap;
  const ListTitleAkun({
    super.key,
    required this.title,
    required this.title1,
    required this.iconUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                title1,
                style: blackRegulerTextStyle.copyWith(
                    fontSize: 12, color: blackColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
