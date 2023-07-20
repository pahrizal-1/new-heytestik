import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/verifikasi_data_scan_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'camera_ktp_setings_page.dart';

class PotoKtp extends StatelessWidget {
  const PotoKtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
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
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Expanded(
                child: Text(
                  'Foto KTP',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 56, bottom: 82, left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            const SizedBox(
              height: 134,
            ),
            Text(
              'Pastikan informasi di foto ini sudah terlihat jelas, ya :)',
              style: whiteTextStyle.copyWith(fontWeight: regular),
            ),
            const SizedBox(
              height: 33,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CameraCutomeKTP(),
                          ),
                        );
                      },
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
                const SizedBox(
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
