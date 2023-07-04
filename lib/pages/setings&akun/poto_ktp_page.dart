import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/verifikasi_data_scan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class PotoKtp extends StatelessWidget {
  const PotoKtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 56, bottom: 82, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  'Foto KTP',
                  style: whiteTextStyle.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 163,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/ktp2.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Spacer(),
            Text(
              'Pastikan informasi di foto ini sudah terlihat jelas, ya :)',
              style: whiteTextStyle.copyWith(fontWeight: regular),
            ),
            SizedBox(
              height: 33,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        side: BorderSide(color: borderColor, width: 0.5),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Foto Ulang',
                        style: TextStyle(
                          fontSize: 14,
                          color: whiteColor,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const VerifikasiDataScan(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: greenColor, width: 2),
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lanjut',
                        style: TextStyle(
                          fontSize: 15,
                          color: whiteColor,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
