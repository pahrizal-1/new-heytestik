// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:io';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/pages/auth/login_page_new.dart';
import 'package:heystetik_mobileapps/pages/bantuan_mihey/pilih_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/selesai_pembayaran_konsultasi_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/success_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/detail_transaksi_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_produk_page.dart';
import 'package:heystetik_mobileapps/pages/solution/selesai_pembayaran_treatment_page.dart';
import 'package:heystetik_mobileapps/pages/tabbar/tabbar_customer.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import '../../theme/theme.dart';
import '../../widget/appar_cutome.dart';

class HomeMinheyPage extends StatefulWidget {
  const HomeMinheyPage({super.key});

  @override
  State<HomeMinheyPage> createState() => _HomeMinheyPageState();
}

class _HomeMinheyPageState extends State<HomeMinheyPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  List<Data2> history = [];
  int page = 1;
  String? search;
  Map<String, dynamic> filter = {};
  int totalPending = 0;
  bool isLogin = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var cek = await LocalStorage().getAccessToken();
      if (cek == '-') {
        isLogin = false;
        return;
      }

      isLogin = true;
      history.addAll(await state.getAllHistory(
        context,
        page,
        search: search,
        filter: filter,
      ));

      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            history.addAll(await state.getAllHistory(
              context,
              page,
              search: search,
              filter: filter,
            ));
            setState(() {});
            state.isLoadingMore.value = false;
          });
        }
      }
    });
    super.initState();
  }

  _whatsapp(BuildContext context) async {
    var contact = "+6281287639838";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      SnackbarWidget.getErrorSnackbar(
        context,
        'Info',
        'WhatsApp is not installed.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustome(
        colorIcons: blackColor,
        colorTitle: blackColor,
        title: 'Bantuan MinHey',
        bgColor: whiteColor,
      ),
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 26, right: 26, top: 20, bottom: 17),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/icons/bg_wekkly.png',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, sobat Hey 👋🏻',
                  style: whiteTextStyle.copyWith(
                      fontWeight: regular, fontSize: 15),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'Ada yang bisa Minhey bantu?',
                  style: whiteTextStyle.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 13,
                          right: 10,
                        ),
                        child: Image.asset(
                          'assets/icons/search1.png',
                          width: 15,
                        ),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -4, 0),
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: TextFormField(
                          // controller: searchController,
                          // onEditingComplete: () async {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => TreatmentSearch(
                          //           search: searchController.text),
                          //     ),
                          //   );
                          // page = 1;
                          // treatments.clear();
                          // search = searchController.text;
                          // treatments.addAll(await stateTreatment.getAllTreatment(context, page, search: search));
                          // setState(() {});
                          // },
                          style: const TextStyle(
                              fontSize: 15, fontFamily: "ProximaNova"),
                          decoration: InputDecoration(
                            hintText: "Cari topik atau ketik pertanyaanmu",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: "ProximaNova",
                              color: fromCssColor(
                                '#9B9B9B',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isLogin)
            Padding(
              padding: lsymetric.copyWith(top: 20, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ada kendala dalam transaksimu?',
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Pilih transaksi yang berkendala dalam 1 bulan terakhir',
                    style: blackRegulerTextStyle.copyWith(fontSize: 13),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...history.map((val) {
                          if (val.transactionType == 'CONSULTATION') {
                            return InkWell(
                              onTap: () {
                                if (val.detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  Get.to(
                                      () => SelesaikanPembayaranKonsultasiPage(
                                            isWillPop: false,
                                            orderId: val.detail!.orderId!,
                                            expireTime: '',
                                            paymentMethodId:
                                                val.detail!.paymentMethodId!,
                                          ));
                                } else if (val.detail?.status == 'READY') {
                                  Get.to(() => SuccessPage(
                                        isNotConsultation: false,
                                        orderId: val.detail?.orderId ?? '',
                                        isWillPop: false,
                                      ));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardTransProd11(
                                  data: val,
                                ),
                              ),
                            );
                          } else if (val.transactionType == 'TREATMENT') {
                            return InkWell(
                              onTap: () {
                                if (val.detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  Get.to(() =>
                                      SelesaikanPembayaranTreatmentPage(
                                        isWillPop: false,
                                        orderId: val.transactionId.toString(),
                                        expireTime: '',
                                        paymentMethodId:
                                            val.detail!.paymentMethodId!,
                                      ));
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardTransProd11(
                                  data: val,
                                ),
                              ),
                            );
                          } else if (val.transactionType == 'PRODUCT') {
                            return InkWell(
                              onTap: () {
                                if (val.detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  Get.to(
                                    () => SelesaikanPembayaranProdukPage(
                                      isWillPop: false,
                                      orderId: val.detail!.orderId!,
                                      expireTime: '',
                                      paymentMethodId:
                                          val.detail!.paymentMethodId!,
                                    ),
                                  );
                                } else if (val.detail?.status == 'SELESAI') {
                                  Get.to(
                                    () => DetailTransaksiPage(
                                      transactionId: val.detail!.id!,
                                    ),
                                  );
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardTransProd11(
                                  data: val,
                                ),
                              ),
                            );
                          }
                          return Container();
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => PilihTranskasiMinheyPage());
                    },
                    child: Text(
                      'Pilih Transaksi Lain',
                      style: grenTextStyle.copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
            )
          else
            Padding(
              padding: lsymetric.copyWith(top: 20, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masuk untuk mendapat bantuan terkait transaksi',
                    style: blackTextStyle.copyWith(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => LoginPageNew());
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                          fontSize: 13,
                          color: whiteColor,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          dividergreen(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: lsymetric.copyWith(top: 20),
                child: Text(
                  'Pilih topik sesuai kendalamu',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/akun&keamanan.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Akun &\nKeamanan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/pesanan.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pesanan\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/pengriman.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pengiriman\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/icons/pembayraan.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pembayaran\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/promosi.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Promosi\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/icons/komplanPesanan.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Komplan \nPesanan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/icons/pengembaliandana.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Pengembalian\nDana',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image: AssetImage('assets/icons/lainnya.png'),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                'Lainya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'ProximaNova',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 46,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Yang sering ditanyakan',
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
                TextArrow(
                  title1: 'Apakah Heystetik itu Klinik?',
                ),
                TextArrow(
                  title1:
                      'Apakah saya bisa mengajukan pengembalian\ndana apabila saya membatalkan konsultasi?',
                ),
                TextArrow(
                  title1: 'Apakah Heystetik itu Klinik?',
                ),
                TextArrow(
                  title1: 'Apakah Heystetik itu Klinik?',
                ),
                SizedBox(
                  height: 47,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25, right: 25, top: 22, bottom: 41),
            color: Color(0xffCCCCCC).withOpacity(0.3),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hubungi Customer Support',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Kami siap membantu :)',
                style: blackRegulerTextStyle.copyWith(fontSize: 13),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/mail-icons-cirkel.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () =>
                        launchUrl(Uri.parse('mailto:Care@heystetik.com')),
                    child: Text(
                      'Care@heystetik.com',
                      style: grenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/wa-icons-Wassap.png',
                    width: 30,
                    height: 30,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  InkWell(
                    onTap: () async {
                      await _whatsapp(context);
                    },
                    child: Text(
                      '+62 8517 120 2394',
                      style: grenTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
          Padding(
            padding: lsymetric.copyWith(bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextArrow(
                  title1: 'Syarat & Ketentuan Penggunaan Heystetik',
                ),
                TextArrow(
                  title1: 'Kebijakan Privasi Heystetik',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardTransProd11 extends StatelessWidget {
  Data2 data;
  CardTransProd11({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ConvertDate.defaultDate(data.createdAt ?? '-'),
                style: blackRegulerTextStyle.copyWith(fontSize: 10),
              ),
              if (data.transactionType == 'PRODUCT')
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: data.detail?.orderStatus.toString() == 'NEW_ORDER' ||
                            data.detail?.orderStatus.toString() ==
                                'DELIVERY_PROCESS' ||
                            data.detail?.orderStatus.toString() == 'IN_DELIVERY'
                        ? const Color.fromARGB(255, 255, 204, 170)
                        : data.detail?.orderStatus.toString() ==
                                'ORDER_COMPLETED'
                            ? subgreenColor
                            : subgreenColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    data.detail?.orderStatus.toString() == 'NEW_ORDER' ||
                            data.detail?.orderStatus.toString() ==
                                'DELIVERY_PROCESS'
                        ? 'Pesanan Diproses'
                        : data.detail?.orderStatus.toString() == 'IN_DELIVERY'
                            ? 'Pesanan Dikirim'
                            : data.detail?.orderStatus.toString() ==
                                    'ORDER_COMPLETED'
                                ? 'Selesai'
                                : 'Selesai',
                    style: grenTextStyle.copyWith(
                      fontSize: 10,
                      color:
                          data.detail?.orderStatus.toString() == 'NEW_ORDER' ||
                                  data.detail?.orderStatus.toString() ==
                                      'DELIVERY_PROCESS' ||
                                  data.detail?.orderStatus.toString() ==
                                      'IN_DELIVERY'
                              ? const Color.fromARGB(255, 255, 102, 0)
                              : data.detail?.orderStatus.toString() ==
                                      'ORDER_COMPLETED'
                                  ? greenColor
                                  : greenColor,
                    ),
                  ),
                )
              else if (data.transactionType == 'TREATMENT')
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                        ? const Color.fromARGB(255, 255, 204, 170)
                        : data.detail?.status == 'MENUNGGU_KONFIRMASI_KLINIK'
                            ? const Color.fromARGB(255, 255, 204, 170)
                            : data.detail?.status == 'KLINIK_MENGKONFIRMASI'
                                ? subgreenColor
                                : data.detail?.status == 'SELESAI'
                                    ? subgreenColor
                                    : subgreenColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                        ? 'Menunggu Pembayaran'
                        : data.detail?.status == 'MENUNGGU_KONFIRMASI_KLINIK'
                            ? 'Menunggu Konfirmasi Klinik'
                            : data.detail?.status == 'KLINIK_MENGKONFIRMASI'
                                ? 'Klinik Mengkonfirmasi'
                                : data.detail?.status == 'SELESAI'
                                    ? 'Selesai'
                                    : 'Selesai',
                    style: grenTextStyle.copyWith(
                      fontSize: 10,
                      color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                          ? const Color.fromARGB(255, 255, 102, 0)
                          : data.detail?.status == 'MENUNGGU_KONFIRMASI_KLINIK'
                              ? const Color.fromARGB(255, 255, 102, 0)
                              : data.detail?.status == 'KLINIK_MENGKONFIRMASI'
                                  ? greenColor
                                  : data.detail?.status == 'SELESAI'
                                      ? greenColor
                                      : greenColor,
                    ),
                  ),
                )
              else if (data.transactionType == 'CONSULTATION')
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                        ? const Color.fromARGB(255, 255, 204, 170)
                        : data.detail?.status == 'READY'
                            ? const Color.fromARGB(255, 255, 204, 170)
                            : data.detail?.status == 'REVIEW'
                                ? const Color.fromARGB(255, 255, 204, 170)
                                : data.detail?.status == 'AKTIF'
                                    ? subgreenColor
                                    : data.detail?.status == 'SELESAI'
                                        ? subgreenColor
                                        : subgreenColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                        ? 'Menunggu Pembayaran'
                        : data.detail?.status == 'READY'
                            ? 'Ready'
                            : data.detail?.status == 'REVIEW'
                                ? 'Review'
                                : data.detail?.status == 'AKTIF'
                                    ? 'Aktif'
                                    : data.detail?.status == 'SELESAI'
                                        ? 'Selesai'
                                        : 'Selesai',
                    style: grenTextStyle.copyWith(
                      fontSize: 10,
                      color: data.detail?.status == 'MENUNGGU_PEMBAYARAN'
                          ? const Color.fromARGB(255, 255, 102, 0)
                          : data.detail?.status == 'READY'
                              ? const Color.fromARGB(255, 255, 102, 0)
                              : data.detail?.status == 'REVIEW'
                                  ? const Color.fromARGB(255, 255, 102, 0)
                                  : data.detail?.status == 'AKTIF'
                                      ? greenColor
                                      : data.detail?.status == 'SELESAI'
                                          ? greenColor
                                          : greenColor,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              if (data.transactionType == 'PRODUCT')
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          '${Global.FILE}/${data.detail?.transactionProductItems?[0].product!.mediaProducts?[0].media?.path}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else if (data.transactionType == 'TREATMENT')
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${Global.FILE}/${data.detail?.transactionTreatmentItems?[0].treatment?.mediaTreatments?[0].media?.path}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else if (data.transactionType == 'CONSULTATION')
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${Global.FILE}/${data.detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.transactionType == 'PRODUCT')
                    Text(
                      data.detail?.transactionProductItems?[0].product?.name ??
                          '-',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    )
                  else if (data.transactionType == 'TREATMENT')
                    Text(
                      data.detail?.transactionTreatmentItems?[0].treatment
                              ?.name ??
                          '-',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    )
                  else if (data.transactionType == 'CONSULTATION')
                    Text(
                      data.detail?.consultation?.doctor?.fullname ?? '-',
                      style: blackTextStyle.copyWith(fontSize: 13),
                    ),
                  SizedBox(
                    height: 2,
                  ),
                  if (data.transactionType == 'PRODUCT')
                    RichText(
                      text: TextSpan(
                        text: '1 Barang',
                        style: subTitleTextStyle.copyWith(fontSize: 12),
                        children: [
                          TextSpan(
                            text: (data.detail?.transactionProductItems
                                            ?.length ??
                                        0) >
                                    1
                                ? ' +${(data.detail?.transactionProductItems?.length ?? 0) - 1} barang lainnya'
                                : '',
                            style: grenTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  else if (data.transactionType == 'TREATMENT')
                    Text(
                      data.detail?.transactionTreatmentItems?[0].treatment
                              ?.clinic?.name ??
                          '-',
                      style: subTitleTextStyle.copyWith(fontSize: 13),
                    )
                  else if (data.transactionType == 'CONSULTATION')
                    Text(
                      data.detail?.medicalHistory?.interestCondition?.concern
                              ?.name ??
                          '-',
                    ),
                  SizedBox(
                    height: 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Total :',
                      style: blackRegulerTextStyle.copyWith(fontSize: 12),
                      children: [
                        TextSpan(
                          text:
                              ' ${CurrencyFormat.convertToIdr(data.detail?.totalPaid, 0)}',
                          style: grenTextStyle.copyWith(
                            fontSize: 12,
                            color: Color(
                              0xffF76707,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 14,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: TextButton(
              onPressed: () {
                Get.to(() => const TabBarCustomer(currentIndex: 3));
              },
              style: TextButton.styleFrom(
                backgroundColor: greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Pilih Solusi Cepat',
                style: TextStyle(
                  fontSize: 13,
                  color: whiteColor,
                  fontWeight: bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextArrow extends StatelessWidget {
  final String title1;
  final VoidCallback? onPressed;
  const TextArrow({
    super.key,
    required this.title1,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Text(
            title1,
            style: blackRegulerTextStyle.copyWith(fontSize: 14),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            color: greenColor,
          ),
        ],
      ),
    );
  }
}
