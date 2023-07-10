import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/pilih_metode_verifikasi_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/ubah_nama_profil_customer_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class EditProfilCostomer extends StatelessWidget {
  const EditProfilCostomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Rina Rasmalina',
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
                Container(
                  width: 75,
                  height: 75,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profiledummy.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Ubah Foto Profil',
                  style: grenTextStyle.copyWith(fontSize: 15),
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
                        'Rina Rasmalina',
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
                Row(
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
                const SizedBox(
                  height: 12,
                ),
                Row(
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
                      width: 73,
                    ),
                    Text(
                      '123456',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: blackColor),
                      textAlign: TextAlign.start,
                    ),
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
                            const PilihMetodeVerifikasiProfil(),
                      ),
                    );
                  },
                  child: const TextProfil(
                    title2: 'rasmalina.rina@gmail.com',
                    widtd: 84,
                    titlel: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const TextProfil(
                  title2: '085211234567',
                  widtd: 52,
                  titlel: 'Nomor HP',
                ),
                const SizedBox(
                  height: 12,
                ),
                const TextProfil(
                  title2: 'Perempuan',
                  widtd: 29,
                  titlel: 'Jenis Kelamin',
                ),
                const SizedBox(
                  height: 12,
                ),
                const TextProfil(
                  title2: '1 Januari 2003',
                  widtd: 31,
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
            child: Text(
              'Tutup Akun',
              style: grenTextStyle.copyWith(fontSize: 15),
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
  final double widtd;
  const TextProfil({
    super.key,
    required this.titlel,
    required this.title2,
    required this.widtd,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titlel,
          style: subTitleTextStyle.copyWith(fontSize: 15),
        ),
        SizedBox(
          width: widtd,
        ),
        Text(
          title2,
          style:
              blackRegulerTextStyle.copyWith(fontSize: 15, color: blackColor),
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        Image.asset(
          'assets/icons/arrow-left-hight.png',
          width: 25,
          color: blackColor,
        )
      ],
    );
  }
}
