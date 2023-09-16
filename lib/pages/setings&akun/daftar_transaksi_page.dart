import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/menunggu_pembayaran_page.dart';
import 'package:heystetik_mobileapps/widget/filter_jenis_transaksi.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/transaction_history_model.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/daftar_transaksi_widgets.dart';
import '../../widget/filter_status_transaksi.dart';
import '../../widget/filter_tanggal_transaksi.dart';
import '../../widget/show_modal_dialog.dart';

class DaftarTransaksiPage extends StatefulWidget {
  const DaftarTransaksiPage({super.key});

  @override
  State<DaftarTransaksiPage> createState() => _DaftarTransaksiPageState();
}

class _DaftarTransaksiPageState extends State<DaftarTransaksiPage> {
  final HistoryTransactionController state =
      Get.put(HistoryTransactionController());
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  List<Data2> history = [];
  int page = 1;
  String? search;
  Map<String, dynamic> filter = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: iconthemeblack(),
        elevation: 2,
        backgroundColor: whiteColor,
        title: Container(
          margin: EdgeInsets.only(left: 20),
          height: 43,
          child: Center(
            child: TextFormField(
              controller: searchController,
              onEditingComplete: () async {
                page = 1;
                search = searchController.text;
                history.clear();
                history.addAll(await state.getAllHistory(context, page,
                    search: search, filter: filter));
                setState(() {});
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor),
                  borderRadius: BorderRadius.circular(7),
                ),
                prefixIcon: Icon(Icons.search),
                prefixIconColor: subgreyColor,
                hintText: 'Cari Transaksi',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              TotalKeranjang(iconcolor: blackColor),
              const SizedBox(
                width: 14,
              ),
              InkWell(
                onTap: () {
                  Get.to(AkunHomePage());
                },
                child: SvgPicture.asset(
                  'assets/icons/humberger-icons.svg',
                ),
              ),
              const SizedBox(
                width: 26,
              ),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 26, top: 9, right: 26, bottom: 8),
                    child: Row(
                      children: [
                        filter.isEmpty
                            ? Container()
                            : InkWell(
                                onTap: () async {
                                  filter.clear();
                                  page = 1;
                                  history.clear();
                                  history.addAll(await state.getAllHistory(
                                      context, page,
                                      search: search, filter: filter));
                                  setState(() {});
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: borderColor,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: const Icon(Icons.close),
                                ),
                              ),
                        InkWell(
                          onTap: () {
                            customeshomodal(context, FilterStatusTransaksi())
                                .then((value) async {
                              filter['transaction_status[]'] = value;
                              page = 1;
                              history.clear();
                              history.addAll(await state.getAllHistory(
                                  context, page,
                                  search: search, filter: filter));
                              setState(() {});
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    'Status Transaksi',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            customeshomodal(context, FilterJenisTransaksi())
                                .then((value) async {
                              filter['transaction_type[]'] = value;
                              page = 1;
                              history.clear();
                              history.addAll(await state.getAllHistory(
                                  context, page,
                                  search: search, filter: filter));
                              setState(() {});
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    'Jenis Transaksi',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            customeshomodal(context, FilterTanggalTransaksi())
                                .then((value) async {
                              filter['start_date'] = DateTime.now()
                                  .subtract(Duration(days: value));
                              filter['end_date'] = DateTime.now()
                                  .subtract(Duration(days: value));
                              page = 1;
                              history.clear();
                              history.addAll(await state.getAllHistory(
                                  context, page,
                                  search: search, filter: filter));
                              setState(() {});
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 5),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    'Tanggal Transaksi',
                                    style: blackRegulerTextStyle.copyWith(
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(7),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor,
                      blurRadius: 0.5,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        () => MenungguPemayaranPage(
                          search: search,
                          filter: filter,
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/icons/transaksi_logo.png',
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          'Menunggu Pembayaran',
                          style: blackHigtTextStyle.copyWith(fontSize: 15),
                        ),
                        const Spacer(),
                        Obx(
                          () => state.totalPending.value == 0
                              ? Container()
                              : Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: redColor),
                                  child: Text(
                                    state.totalPending.value.toString(),
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 10),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/arrow-left-hight.png',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => LoadingWidget(
                  isLoading:
                      state.isLoadingMore.value ? false : state.isLoading.value,
                  child: history.isEmpty
                      ? Center(
                          child: Text(
                            'Belum ada transaksi',
                            style: TextStyle(
                              fontWeight: bold,
                              fontFamily: 'ProximaNova',
                              fontSize: 20,
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: spaceHeigt,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: history.length,
                                itemBuilder: (BuildContext context, index) {
                                  if (history[index].transactionType ==
                                      'CONSULTATION') {
                                    return TransaksiKonsultan(
                                      namaDokter:
                                          history[index].detail?.consultation ==
                                                  null
                                              ? '-'
                                              : history[index]
                                                      .detail
                                                      ?.consultation!
                                                      .doctor
                                                      ?.fullname ??
                                                  '-',
                                      tanggal: ConvertDate.defaultDate(
                                          history[index].createdAt ?? '-'),
                                      pesanan: 'Konsultasi',
                                      progres: history[index].detail?.status ==
                                              'MENUNGGU_PEMBAYARAN'
                                          ? 'Menunggu Pembayaran'
                                          : history[index].detail?.status ==
                                                  'READY'
                                              ? 'Ready'
                                              : history[index].detail?.status ==
                                                      'REVIEW'
                                                  ? 'Review'
                                                  : history[index]
                                                              .detail
                                                              ?.status ==
                                                          'AKTIF'
                                                      ? 'Aktif'
                                                      : history[index]
                                                                  .detail
                                                                  ?.status ==
                                                              'SELESAI'
                                                          ? 'Selesai'
                                                          : '-',
                                      keluhan:
                                          history[index].detail?.consultation ==
                                                  null
                                              ? '-'
                                              : history[index]
                                                      .detail
                                                      ?.consultation
                                                      ?.medicalHistory
                                                      ?.interestCondition
                                                      ?.name ??
                                                  '-',
                                      harga: CurrencyFormat.convertToIdr(
                                          history[index].detail?.totalPaid, 0),
                                      img: history[index]
                                                  .detail
                                                  ?.consultation ==
                                              null
                                          ? '-'
                                          : '${Global.FILE}/${history[index].detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                                      doneReview: history[index]
                                                  .detail
                                                  ?.consultationReview ==
                                              null
                                          ? false
                                          : true,
                                    );
                                  }

                                  if (history[index].transactionType ==
                                      'TREATMENT') {
                                    return TransaksiTreatment(
                                      item: history[index]
                                          .detail
                                          ?.transactionTreatmentItems,
                                      tanggal: ConvertDate.defaultDate(
                                          history[index].createdAt ?? '-'),
                                      pesanan: 'Treatment',
                                      progres: history[index].detail?.status ==
                                              'MENUNGGU_PEMBAYARAN'
                                          ? 'Menunggu Pembayaran'
                                          : history[index].detail?.status ==
                                                  'MENUNGGU_KONFIRMASI_KLINIK'
                                              ? 'Menunggu Konfirmasi Klinik'
                                              : history[index].detail?.status ==
                                                      'KLINIK_MENGKONFIRMASI'
                                                  ? 'Klinik Mengkonfirmasi'
                                                  : history[index]
                                                              .detail
                                                              ?.status ==
                                                          'SELESAI'
                                                      ? 'Selesai'
                                                      : '-',
                                      harga: CurrencyFormat.convertToIdr(
                                          history[index].detail?.totalPaid, 0),
                                      doneReview: history[index]
                                                  .detail!
                                                  .transactionTreatmentItems?[0]
                                                  .treatmentReview ==
                                              null
                                          ? false
                                          : true,
                                    );
                                  }

                                  if (history[index].transactionType ==
                                      'PRODUCT') {
                                    return TransaksiProduk(
                                      product: history[index].detail,
                                    );
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Obx(
                                () => state.isLoading.value
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: LoadingMore(),
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
