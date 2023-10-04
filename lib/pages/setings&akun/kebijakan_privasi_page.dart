import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

class KebijakanPrivasiPage extends StatefulWidget {
  const KebijakanPrivasiPage({super.key});

  @override
  State<KebijakanPrivasiPage> createState() => _KebijakanPrivasiPageState();
}

class _KebijakanPrivasiPageState extends State<KebijakanPrivasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        backgroundColor: Colors.transparent,
        title: Text(
          'Kebijakan Privasi Heystetik',
          style: blackHigtTextStyle.copyWith(fontSize: 20),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Center(
                child: Text(
              'KEBIJAKAN PRIVASI HEYSTETIK',
              style: grenTextStyle.copyWith(fontSize: 20),
            )),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: MediaQuery.of(context).size.width,
              // margin: EdgeInsets.symmetric(horizontal: 14),
              padding:
                  EdgeInsets.only(left: 14, top: 10, right: 14, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffD9D9D9), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'SYARAT DAN KETENTUAN PENGGUNAAN HEYSTETIK ',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '(Terakhir diperbarui tanggal: 9 Agustus 2023)',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'MOHON UNTUK MEMBACA SELURUH SYARAT DAN KETENTUAN PENGGUNAAN SERTA KEBIJAKAN PRIVASI HEYSTETIK DENGAN CERMAT DAN SAKSAMA SEBELUM MENGGUNAKAN SETIAP FITUR DAN/ATAU LAYANAN YANG TERSEDIA DALAM PLATFORM HEYSTETIK.',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      'Syarat dan Ketentuan Penggunaan Heystetik (“Ketentuan Penggunaan”) ini merupakan suatu perjanjian sah terkait tata cara dan persyaratan penggunaan fitur dan/atau layanan (“Layanan”) Platform Heystetik (“Platform”) antara Pengguna (“Anda”) dengan pengelola Platform, yaitu PT Neosains Medika Teknologi (“Kami”). Dengan mengunduh dan/atau memasang dan/atau menggunakan Platform dan/atau menikmati Layanan Kami, Anda setuju bahwa Anda telah membaca, memahami, mengetahui, menerima, dan menyetujui seluruh informasi, syarat-syarat, dan ketentuan-ketentuan penggunaan Platform yang terdapat dalam Ketentuan Penggunaan ini.'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Kami dapat mengubah ketentuan dalam Ketentuan Penggunaan ini kapan saja. Perubahan tersebut akan berlaku setelah ditampilkan di Platform. Adalah tanggung jawab Anda untuk meninjau Ketentuan Penggunaan secara teratur. Keberlanjutan Anda atas penggunaan Platform setelah adanya setiap perubahan tersebut, baik telah Anda tinjau atau tidak, akan merupakan perjanjian Anda untuk terikat oleh setiap perubahan tersebut. Apabila Anda tidak setuju terhadap salah satu, sebagian, atau seluruh isi yang tertuang dalam Ketentuan Penggunaan ini, silakan untuk menghapus Platform dalam perangkat elektronik Anda dan/atau tidak mengakses Platform dan/atau tidak menggunakan Layanan Kami',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('')
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
