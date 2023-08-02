import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/account_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/all_history_transaction_controller.dart';
import 'package:heystetik_mobileapps/pages/myJourney/home_journey.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/daftar_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/setings_akun_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/ulasan_settings_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/wishlist_page.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';

import '../../theme/theme.dart';
import '../tabbar/tabbar_customer.dart';

class AkunHomePage extends StatefulWidget {
  AkunHomePage({super.key});

  @override
  State<AkunHomePage> createState() => _AkunHomePageState();
}

class _AkunHomePageState extends State<AkunHomePage> {
  final AccountController state = Get.put(AccountController());
  final AllHistoryTransactionController stateTransaction =
      Get.put(AllHistoryTransactionController());
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
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profiledummy.png'),
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
                                state.fullName.value,
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
                isSelcted
                    ? Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 16, bottom: 17),
                        decoration: BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
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
                                  height: 2,
                                ),
                                Text(
                                  'Dokumentasikan progres kulitmu setiap hari dalam penggunaan obat/skincare/treatment dan lihat perubahan yang terjadi pada kulitmu.',
                                  style: TextStyle(
                                    fontSize: 11,
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Cobain yuk!',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        color: whiteColor,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            isSelcted = !isSelcted;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border:
                                  Border.all(color: const Color(0xFFCCCCCC))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Journey',
                                style:
                                    blackHigtTextStyle.copyWith(fontSize: 15),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 14,
                ),
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
          FutureBuilder(
            future: stateTransaction.getMyActivity(context),
            builder: (context, AsyncSnapshot snapshot) {
              print(snapshot.connectionState);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        shimmerWidget(
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        shimmerWidget(
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                        shimmerWidget(
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 24),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.circular(7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return stateTransaction.activity.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada aktivitas',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 15,
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 70,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: stateTransaction.activity.length,
                            itemBuilder: (BuildContext context, index) {
                              // JANGAN TAMPILKAN YG STATUSNYA SELESAI
                              if (stateTransaction.activity[index].status !=
                                  'SELESAI') {
                                if (stateTransaction
                                        .activity[index].transactionType ==
                                    'CONSULTATION') {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/chat.png',
                                            width: 18,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                stateTransaction.activity[index]
                                                            .status ==
                                                        'MENUNGGU_PEMBAYARAN'
                                                    ? 'Menunggu Pembayaran'
                                                    : stateTransaction
                                                                .activity[index]
                                                                .status ==
                                                            'READY'
                                                        ? 'Ready'
                                                        : stateTransaction
                                                                    .activity[
                                                                        index]
                                                                    .status ==
                                                                'REVIEW'
                                                            ? 'Review'
                                                            : stateTransaction
                                                                        .activity[
                                                                            index]
                                                                        .status ==
                                                                    'AKTIF'
                                                                ? 'Aktif'
                                                                : 'Selesai',
                                                style: grenTextStyle.copyWith(
                                                  fontSize: 12,
                                                  color: stateTransaction
                                                              .activity[index]
                                                              .status ==
                                                          'MENUNGGU_PEMBAYARAN'
                                                      ? const Color.fromARGB(
                                                          255, 255, 102, 0)
                                                      : stateTransaction
                                                                  .activity[
                                                                      index]
                                                                  .status ==
                                                              'READY'
                                                          ? const Color.fromARGB(
                                                              255, 255, 102, 0)
                                                          : stateTransaction
                                                                      .activity[
                                                                          index]
                                                                      .status ==
                                                                  'REVIEW'
                                                              ? const Color.fromARGB(
                                                                  255, 255, 102, 0)
                                                              : stateTransaction.activity[index].status ==
                                                                      'AKTIF'
                                                                  ? greenColor
                                                                  : greenColor,
                                                ),
                                              ),
                                              Text(
                                                'Konsultasi Bekas Jerawat',
                                                style:
                                                    blackHigtTextStyle.copyWith(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }

                                if (stateTransaction
                                        .activity[index].transactionType ==
                                    'TREATMENT') {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      left: 25,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: borderColor),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'assets/icons/treatmen-cornern.png',
                                            width: 18,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                stateTransaction.activity[index]
                                                            .status ==
                                                        'MENUNGGU_PEMBAYARAN'
                                                    ? 'Menunggu Pembayaran'
                                                    : stateTransaction
                                                                .activity[index]
                                                                .status ==
                                                            'MENUNGGU_KONFIRMASI_KLINIK'
                                                        ? 'Menunggu Konfirmasi Klinik'
                                                        : stateTransaction
                                                                    .activity[
                                                                        index]
                                                                    .status ==
                                                                'KLINIK_MENGKONFIRMASI'
                                                            ? 'Klinik Mengkonfirmasi'
                                                            : stateTransaction
                                                                        .activity[
                                                                            index]
                                                                        .status ==
                                                                    'SELESAI'
                                                                ? 'Selesai'
                                                                : 'Selesai',
                                                style: grenTextStyle.copyWith(
                                                  fontSize: 12,
                                                  color: stateTransaction
                                                              .activity[index]
                                                              .status ==
                                                          'MENUNGGU_PEMBAYARAN'
                                                      ? const Color.fromARGB(
                                                          255, 255, 102, 0)
                                                      : stateTransaction
                                                                  .activity[
                                                                      index]
                                                                  .status ==
                                                              'MENUNGGU_KONFIRMASI_KLINIK'
                                                          ? const Color.fromARGB(
                                                              255, 255, 102, 0)
                                                          : stateTransaction
                                                                      .activity[
                                                                          index]
                                                                      .status ==
                                                                  'KLINIK_MENGKONFIRMASI'
                                                              ? greenColor
                                                              : stateTransaction
                                                                          .activity[
                                                                              index]
                                                                          .status ==
                                                                      'SELESAI'
                                                                  ? greenColor
                                                                  : greenColor,
                                                ),
                                              ),
                                              Text(
                                                stateTransaction
                                                    .activity[index]
                                                    .transactionTreatmentItems[
                                                        0]
                                                    .treatment
                                                    .name,
                                                style:
                                                    blackHigtTextStyle.copyWith(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }
                              return Container();
                            },
                          ),
                        );
                } else {
                  return Center(
                    child: Text(
                      'Belum ada aktivitas',
                      style: TextStyle(
                        fontWeight: bold,
                        fontFamily: 'ProximaNova',
                        fontSize: 15,
                      ),
                    ),
                  );
                }
              } else {
                return Text('Connection State: ${snapshot.connectionState}');
              }
            },
          ),
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
                Row(
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
