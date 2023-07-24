import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ApporedPage extends StatelessWidget {
  const ApporedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 27,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 90, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/x-circle.png',
              width: 25,
              height: 25,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  border: Border.all(color: greenColor),
                  color: const Color(0xffD9D9D9),
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/icons/person-white.png',
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Text(
                'Berikan Waktu Untuk Menghubungkan Dengan Doctor',
                style: blackRegulerTextStyle.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Tunggu Sebentar ....',
                style: blackTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Halo Muhyi Abdul Basith, Kami Sudah memveritahu dokter Tentang permintaan',
              style: blackRegulerTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '200',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'detik',
                  style: grenTextStyle.copyWith(fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
