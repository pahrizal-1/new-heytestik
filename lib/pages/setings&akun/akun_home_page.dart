import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/account_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chect_out_page.dart';
import 'package:heystetik_mobileapps/pages/myJourney/home_journey.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/setings_akun_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/ulasan_settings_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../../controller/customer/account/profile_controller.dart';
import '../../core/global.dart';
import '../../theme/theme.dart';
import '../bantuan_mihey/home_bantuan_minhey_page.dart';
import '../tabbar/tabbar_customer.dart';

class AkunHomePage extends StatefulWidget {
  AkunHomePage({super.key});

  @override
  State<AkunHomePage> createState() => _AkunHomePageState();
}

class _AkunHomePageState extends State<AkunHomePage> {
  final AccountController state = Get.put(AccountController());
  final HistoryTransactionController stateTransaction =
      Get.put(HistoryTransactionController());
  final ProfileController stateProfile = Get.put(ProfileController());

  bool isSelcted = false;

  @override
  void initState() {
    super.initState();
    state.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                child: Image.asset(
                  'assets/icons/danger-icons.png',
                  width: 15,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Text(
                'Menu Utama',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: lsymetric.copyWith(top: 14, bottom: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilCustomerPage(),
                          ),
                        );
                      },
                      child: Obx(
                        () => Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: stateProfile.imgNetwork.value != ""
                                  ? NetworkImage(
                                          '${Global.FILE}/${stateProfile.imgNetwork.value}')
                                      as ImageProvider
                                  : AssetImage(
                                      'assets/images/profiledummy.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/medal1.png',
                              width: 12,
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            Obx(
                              () => Text(
                                stateProfile.fullName.value,
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/saldo-icons.svg'),
                            const SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Rp0',
                              style:
                                  blackRegulerTextStyle.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(const SetingsAkunPage());
                      },
                      child: Image.asset(
                        'assets/icons/setings-icons.png',
                        width: 18,
                        height: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.only(
                  left: 30, right: 25, top: 23, bottom: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg-my-jouney.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Journey',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: whiteColor,
                      fontSize: 18,
                      fontFamily: 'ProximaNova',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Dokumentasikan progres kulitmu setiap hari dalam penggunaan obat/skincare/treatment dan lihat perubahan yang terjadi pada kulitmu.',
                    style: TextStyle(
                      fontSize: 13,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(HomeMyjourney());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Cobain yuk!',
                          style: whiteTextStyle.copyWith(
                              fontSize: 13, fontWeight: bold),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: whiteColor,
                          size: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabBarCustomer(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/icon_home1.svg',
                        width: 24,
                        color: blackColor,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'Kembali ke Beranda',
                          style: blackRegulerTextStyle.copyWith(
                              fontSize: 15, color: blackColor),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                dividergrey(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Aktivitas saya',
                  style: blackHigtTextStyle.copyWith(
                      fontSize: 15, color: blackColor),
                ),
              ],
            ),
          ),
          // FutureBuilder(
          //   future: stateTransaction.getMyActivity(context),
          //   builder: (context, AsyncSnapshot snapshot) {
          //     print(snapshot.connectionState);
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return SizedBox(
          //         height: 50,
          //         child: Padding(
          //           padding: const EdgeInsets.only(left: 25, right: 25),
          //           child: ListView(
          //             shrinkWrap: true,
          //             scrollDirection: Axis.horizontal,
          //             physics: const NeverScrollableScrollPhysics(),
          //             children: [
          //               shimmerWidget(
          //                 child: Container(
          //                   width: 100,
          //                   margin: const EdgeInsets.only(right: 5),
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 16, vertical: 24),
          //                   decoration: BoxDecoration(
          //                     color: whiteColor,
          //                     border: Border.all(color: borderColor),
          //                     borderRadius: BorderRadius.circular(7),
          //                   ),
          //                 ),
          //               ),
          //               shimmerWidget(
          //                 child: Container(
          //                   width: 100,
          //                   margin: const EdgeInsets.only(right: 5),
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 16, vertical: 24),
          //                   decoration: BoxDecoration(
          //                     color: whiteColor,
          //                     border: Border.all(color: borderColor),
          //                     borderRadius: BorderRadius.circular(7),
          //                   ),
          //                 ),
          //               ),
          //               shimmerWidget(
          //                 child: Container(
          //                   width: 100,
          //                   margin: const EdgeInsets.only(right: 5),
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 16, vertical: 24),
          //                   decoration: BoxDecoration(
          //                     color: whiteColor,
          //                     border: Border.all(color: borderColor),
          //                     borderRadius: BorderRadius.circular(7),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       if (snapshot.hasData) {
          //         return stateTransaction.activity.isEmpty
          //             ? Center(
          //                 child: Text(
          //                   'Belum ada aktivitas',
          //                   style: TextStyle(
          //                     fontWeight: bold,
          //                     fontFamily: 'ProximaNova',
          //                     fontSize: 15,
          //                   ),
          //                 ),
          //               )
          //             : SizedBox(
          //                 height: 70,
          //                 child: ListView.builder(
          //                   shrinkWrap: true,
          //                   scrollDirection: Axis.horizontal,
          //                   itemCount: stateTransaction.activity.length,
          //                   itemBuilder: (BuildContext context, index) {
          //                     if (stateTransaction
          //                             .activity[index].transactionType ==
          //                         'CONSULTATION') {
          //                       return Padding(
          //                         padding: const EdgeInsets.only(
          //                           left: 25,
          //                         ),
          //                         child: Container(
          //                           padding: const EdgeInsets.symmetric(
          //                             horizontal: 16,
          //                             vertical: 16,
          //                           ),
          //                           decoration: BoxDecoration(
          //                             border: Border.all(color: borderColor),
          //                             borderRadius: BorderRadius.circular(7),
          //                           ),
          //                           child: Row(
          //                             children: [
          //                               Image.asset(
          //                                 'assets/icons/chat.png',
          //                                 width: 18,
          //                               ),
          //                               const SizedBox(
          //                                 width: 10,
          //                               ),
          //                               Column(
          //                                 crossAxisAlignment:
          //                                     CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     stateTransaction.activity[index]
          //                                                 .status ==
          //                                             'MENUNGGU_PEMBAYARAN'
          //                                         ? 'Menunggu Pembayaran'
          //                                         : stateTransaction
          //                                                     .activity[index]
          //                                                     .status ==
          //                                                 'READY'
          //                                             ? 'Ready'
          //                                             : stateTransaction
          //                                                         .activity[
          //                                                             index]
          //                                                         .status ==
          //                                                     'REVIEW'
          //                                                 ? 'Review'
          //                                                 : stateTransaction
          //                                                             .activity[
          //                                                                 index]
          //                                                             .status ==
          //                                                         'AKTIF'
          //                                                     ? 'Aktif'
          //                                                     : 'Selesai',
          //                                     style: grenTextStyle.copyWith(
          //                                       fontSize: 12,
          //                                       color: stateTransaction
          //                                                   .activity[index]
          //                                                   .status ==
          //                                               'MENUNGGU_PEMBAYARAN'
          //                                           ? const Color.fromARGB(
          //                                               255, 255, 102, 0)
          //                                           : stateTransaction
          //                                                       .activity[index]
          //                                                       .status ==
          //                                                   'READY'
          //                                               ? const Color.fromARGB(
          //                                                   255, 255, 102, 0)
          //                                               : stateTransaction
          //                                                           .activity[
          //                                                               index]
          //                                                           .status ==
          //                                                       'REVIEW'
          //                                                   ? const Color.fromARGB(
          //                                                       255,
          //                                                       255,
          //                                                       102,
          //                                                       0)
          //                                                   : stateTransaction
          //                                                               .activity[index]
          //                                                               .status ==
          //                                                           'AKTIF'
          //                                                       ? greenColor
          //                                                       : greenColor,
          //                                     ),
          //                                   ),
          //                                   Text(
          //                                     stateTransaction.activity[index]
          //                                                 .consultation ==
          //                                             null
          //                                         ? '-'
          //                                         : stateTransaction
          //                                             .activity[index]
          //                                             .consultation
          //                                             .medicalHistory
          //                                             .interestCondition
          //                                             .name,
          //                                     style:
          //                                         blackHigtTextStyle.copyWith(
          //                                       fontSize: 13,
          //                                     ),
          //                                   ),
          //                                 ],
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       );
          //                     }

          //                     if (stateTransaction
          //                             .activity[index].transactionType ==
          //                         'TREATMENT') {
          //                       return Padding(
          //                         padding: const EdgeInsets.only(
          //                           left: 25,
          //                         ),
          //                         child: Container(
          //                           padding: const EdgeInsets.symmetric(
          //                             horizontal: 16,
          //                             vertical: 16,
          //                           ),
          //                           decoration: BoxDecoration(
          //                             border: Border.all(color: borderColor),
          //                             borderRadius: BorderRadius.circular(7),
          //                           ),
          //                           child: Row(
          //                             children: [
          //                               Image.asset(
          //                                 'assets/icons/treatmen-cornern.png',
          //                                 width: 18,
          //                               ),
          //                               const SizedBox(
          //                                 width: 10,
          //                               ),
          //                               Column(
          //                                 crossAxisAlignment:
          //                                     CrossAxisAlignment.start,
          //                                 children: [
          //                                   Text(
          //                                     stateTransaction.activity[index]
          //                                                 .status ==
          //                                             'MENUNGGU_PEMBAYARAN'
          //                                         ? 'Menunggu Pembayaran'
          //                                         : stateTransaction
          //                                                     .activity[index]
          //                                                     .status ==
          //                                                 'MENUNGGU_KONFIRMASI_KLINIK'
          //                                             ? 'Menunggu Konfirmasi Klinik'
          //                                             : stateTransaction
          //                                                         .activity[
          //                                                             index]
          //                                                         .status ==
          //                                                     'KLINIK_MENGKONFIRMASI'
          //                                                 ? 'Klinik Mengkonfirmasi'
          //                                                 : stateTransaction
          //                                                             .activity[
          //                                                                 index]
          //                                                             .status ==
          //                                                         'SELESAI'
          //                                                     ? 'Selesai'
          //                                                     : 'Selesai',
          //                                     style: grenTextStyle.copyWith(
          //                                       fontSize: 12,
          //                                       color: stateTransaction
          //                                                   .activity[index]
          //                                                   .status ==
          //                                               'MENUNGGU_PEMBAYARAN'
          //                                           ? const Color.fromARGB(
          //                                               255, 255, 102, 0)
          //                                           : stateTransaction
          //                                                       .activity[index]
          //                                                       .status ==
          //                                                   'MENUNGGU_KONFIRMASI_KLINIK'
          //                                               ? const Color.fromARGB(
          //                                                   255, 255, 102, 0)
          //                                               : stateTransaction
          //                                                           .activity[
          //                                                               index]
          //                                                           .status ==
          //                                                       'KLINIK_MENGKONFIRMASI'
          //                                                   ? greenColor
          //                                                   : stateTransaction
          //                                                               .activity[
          //                                                                   index]
          //                                                               .status ==
          //                                                           'SELESAI'
          //                                                       ? greenColor
          //                                                       : greenColor,
          //                                     ),
          //                                   ),
          //                                   Text(
          //                                     stateTransaction
          //                                         .activity[index]
          //                                         .transactionTreatmentItems[0]
          //                                         .treatment
          //                                         .name,
          //                                     style:
          //                                         blackHigtTextStyle.copyWith(
          //                                       fontSize: 13,
          //                                     ),
          //                                   ),
          //                                 ],
          //                               )
          //                             ],
          //                           ),
          //                         ),
          //                       );
          //                     }

          //                     return null;
          //                   },
          //                 ),
          //               );
          //       } else {
          //         return Center(
          //           child: Text(
          //             'Belum ada aktivitas',
          //             style: TextStyle(
          //               fontWeight: bold,
          //               fontFamily: 'ProximaNova',
          //               fontSize: 15,
          //             ),
          //           ),
          //         );
          //       }
          //     } else {
          //       return Text('Connection State: ${snapshot.connectionState}');
          //     }
          //   },
          // ),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: lsymetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DaftarTransaksiPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          'assets/icons/daftar-transaksi-icons.svg'),
                      // Image.asset(
                      //   'assets/icons/daftar-transaksi-icons.png',
                      //   width: 16,
                      // ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Daftar Transaksi',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WishListPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/love-wishlist-icons.svg'),
                      // Image.asset(
                      //   'assets/icons/love-grey.png',
                      //   width: 18,
                      // ),

                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        'Wishlist',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UlasanSetingsPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/stars-ulasan-icons.svg'),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        'Ulasan',
                        style: blackRegulerTextStyle.copyWith(
                            fontSize: 15, color: blackColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                dividergrey(),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    Get.to(HomeMinheyPage());
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/minhey.png',
                        width: 24,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Bantuan',
                            style: blackHigtTextStyle.copyWith(fontSize: 15),
                          ),
                          Text(
                            ' MinHey',
                            style: blackHigtTextStyle.copyWith(
                                fontSize: 15, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
