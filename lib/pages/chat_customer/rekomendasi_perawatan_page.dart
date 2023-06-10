import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/search_klink_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';

// class RekomendasiPerawatan1Page extends StatelessWidget {
//   const RekomendasiPerawatan1Page({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 30, right: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 230,
//                 width: 200,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/images/rekomendasi1.png'))),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               RichText(
//                 textAlign: TextAlign.center,
//                 text: const TextSpan(
//                   text:
//                       "Yuk, chat dengan Dokter sekarang untuk mendapatkan rekomendasi perawatan terbaik untukmu :)",
//                   style: TextStyle(
//                       fontFamily: 'ProximaNova',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15,
//                       color: Colors.black),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               ButtonGreenWidget(
//                 title: "Chat Dokter",
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const RekomendasiPerawatan2Page(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class RekomendasiPerawatan1Page extends StatelessWidget {
  const RekomendasiPerawatan1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 195,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/rekomendasi2.png'),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                    child: Container(
                      width: 180,
                      child: Column(
                        children: [
                          RichText(
                            text: const TextSpan(
                              text:
                                  "Hai! Rekomendasi perawatan buat kamu sudah selesai :)",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.white,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          RichText(
                            text: const TextSpan(
                              text:
                                  "Kamu bisa menebus skincare & obat, serta melakukan perawatan yang telah dokter rekomendasikan sekarang!",
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: Colors.white,
                                height: 1.2,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 160,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/dokter2.png'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: fromCssColor('#FF9F314D'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(
                        children: [
                          Container(
                            width: 46,
                            height: 38,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/icons/solutions.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "Kamu bisa tebus rekomendasi obat sebanyak 2 kali lagi.  Masa aktif rekomendasi dokter berlaku hingga 12 Agustus 2023",
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  color: fromCssColor('#323232'),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rekomendasi obat",
                        style: TextStyle(
                          fontWeight: bold,
                          fontSize: 18,
                          fontFamily: 'ProximaNova',
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                      const Text(
                        "13 Mei 2023",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'ProximaNova',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cekbox.svg',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -3, 0),
                        child: const Text(
                          'Pilih semua',
                          style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                              letterSpacing: 0.5,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ContainerProdukPenting(
                      imageProduk: "assets/images/produk1.png",
                      merkProduk: 'Cefila® 200 Cefixime ',
                      penggunaanJadwal: 'sesudah makan',
                      penggunaan: "2x Sehari",
                      harga: "Rp.50.000",
                      stock: '1',
                      jenisProduk: 'Antibiotik Jerawat'),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Rekomendasi Skincare",
                        style: TextStyle(
                          fontWeight: bold,
                          fontSize: 18,
                          fontFamily: 'ProximaNova',
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cekbox.svg',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -3, 0),
                        child: const Text(
                          'Pilih semua',
                          style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                              letterSpacing: 0.5,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ContainerProduk(
                    imageProduk: 'assets/images/produk.png',
                    merkProduk: 'Teenderm gel sensitive 150 ml',
                    penggunaanJadwal: 'Pagi & Malam',
                    penggunaan: '2x sehari',
                    harga: 'Rp. 250.000',
                    stock: '1',
                    jenisProduk: 'Cleanser',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ContainerProduk(
                    imageProduk: 'assets/images/produk.png',
                    merkProduk: 'Teenderm Aqua 200ml',
                    penggunaanJadwal: 'Pagi & Malam',
                    penggunaan: '2x sehari',
                    harga: 'Rp. 150.000',
                    stock: '1',
                    jenisProduk: 'Toner',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ContainerProdukPenting(
                      imageProduk: "assets/images/penting1.png",
                      merkProduk: 'Teenderm Hydra 40ml',
                      penggunaanJadwal: 'Pagi & Malam',
                      penggunaan: '2x sehari',
                      harga: 'Rp175.000',
                      stock: '1',
                      jenisProduk: 'Toner'),
                  const SizedBox(
                    height: 15,
                  ),
                  ContainerProdukPenting(
                      imageProduk: "assets/images/penting2.png",
                      merkProduk: 'Teenderm Alpha Pure 30ml',
                      penggunaanJadwal: 'Pagi & Malam',
                      penggunaan: '2x sehari',
                      harga: 'Rp175.000',
                      stock: '1',
                      jenisProduk: "Krim Jerawat"),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rekomendasi Treatment",
                        style: TextStyle(
                          fontWeight: bold,
                          fontSize: 18,
                          fontFamily: 'ProximaNova',
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cekbox.svg',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -3, 0),
                        child: const Text(
                          'Pilih semua',
                          style: TextStyle(
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                              letterSpacing: 0.5,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: fromCssColor(
                          '#D9D9D9',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 17, right: 10, bottom: 15, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/cekbox.svg',
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5,
                                              color: fromCssColor('#E9E9E9')),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/treat2.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 160),
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Peeling',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  color: greenColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 75,
                                                child: Text(
                                                  "Cost",
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                // color: Colors.amberAccent,
                                                constraints: BoxConstraints(
                                                    maxWidth: 70),
                                                child: Text(
                                                  'Rp100K-Rp600K',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 75,
                                                child: Text(
                                                  "Recov. Time",
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                // color: Colors.amberAccent,
                                                constraints: BoxConstraints(
                                                    maxWidth: 70),
                                                child: Text(
                                                  '2-4 hari',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 75,
                                                child: Text(
                                                  "Type",
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                // color: Colors.amberAccent,
                                                constraints: BoxConstraints(
                                                    maxWidth: 70),
                                                child: Text(
                                                  'Non-Surgical',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            child: ButtonGreenWidget(
                              title: 'Cari & Pilih Klinik',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchKlinkPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: fromCssColor(
                          '#D9D9D9',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 17, right: 10, bottom: 15, left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/cekbox.svg',
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.5,
                                              color: fromCssColor('#E9E9E9')),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/treat1.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            constraints:
                                                BoxConstraints(maxWidth: 160),
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Laser Brightening',
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                  color: greenColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.1,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 75,
                                                child: Text(
                                                  "Cost",
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                // color: Colors.amberAccent,
                                                constraints: BoxConstraints(
                                                    maxWidth: 70),
                                                child: Text(
                                                  'Rp2.500K-Rp5.600K',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 75,
                                                child: Text(
                                                  "Recov. Time",
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                // color: Colors.amberAccent,
                                                constraints: BoxConstraints(
                                                    maxWidth: 70),
                                                child: Text(
                                                  '4-7 hari',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 75,
                                                child: Text(
                                                  "Type",
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                // color: Colors.amberAccent,
                                                constraints: BoxConstraints(
                                                    maxWidth: 70),
                                                child: Text(
                                                  'Non-Surgical',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    fontSize: 12,
                                                    height: 1.3,
                                                    letterSpacing: 0.5,
                                                    color: fromCssColor(
                                                      '#9B9B9B',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 40,
                            child: ButtonGreenWidget(
                              title: 'Cari & Pilih Klinik',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SearchKlinkPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
