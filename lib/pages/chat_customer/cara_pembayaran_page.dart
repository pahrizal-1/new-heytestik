import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import '../../widget/Text_widget.dart';

class CaraPembyaranPage extends StatefulWidget {
  const CaraPembyaranPage({super.key});

  @override
  State<CaraPembyaranPage> createState() => _CaraPembyaranPageState();
}

class _CaraPembyaranPageState extends State<CaraPembyaranPage> {
  bool isVisibelity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenColor,
        title: Row(
          children: [
            Text(
              'Cara Pembayaran',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: lsymetric.copyWith(top: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'BCA Virtual Account',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/logo-bca.png',
                    width: 60,
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 21,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextSpaceBetween(
                        title: 'Nomor Virtual Account',
                        title2: '',
                      ),
                      Text(
                        '1234567890123456',
                        style: blackTextStyle.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Salin',
                    style: grenTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset(
                    'assets/icons/salin_icons.png',
                    width: 14,
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextSpaceBetween(
                        title: 'Total Pembayaran',
                        title2: '',
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp20.000',
                            style: blackTextStyle.copyWith(fontSize: 15),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            'assets/icons/salin_icons.png',
                            width: 14,
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Lihat Detail',
                    style: grenTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 14,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isVisibelity = !isVisibelity;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      'ATM BCA',
                      style: blackTextStyle.copyWith(fontSize: 15),
                    ),
                    const Spacer(),
                    Icon(isVisibelity
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: isVisibelity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // constraints: const BoxConstraints(maxWidth: 240),
                      child: Text(
                        '1. Masukkan Kartu ATM BCA & PIN',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: const Color(0xff323232)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '2. Pilih menu Transaksi Lainnya > Transfer > Ke Rek BCA Virtual Account.',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: const Color(0xff323232)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3. Masukkan nomor BCA Virtual Account dan klik “Benar"',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: const Color(0xff323232)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '4. Cek detail transaksi dan pilih “Ya”',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: const Color(0xff323232)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '5. Ikuti instruksi untuk menyelesaikan transaksi',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: const Color(0xff323232)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '6. Simpan struk transaksi sebagai bukti pembayaran',
                      style: blackRegulerTextStyle.copyWith(
                          fontSize: 15, color: const Color(0xff323232)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'm-BCA (BCA mobile)',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Internet Banking BCA',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Kantor Bank BCA',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Icon(Icons.keyboard_arrow_down)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
