import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/history/history_transaction_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/akun_home_page.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/menunggu_pembayaran_page.dart';
import 'package:heystetik_mobileapps/widget/filter_jenis_transaksi.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:intl/intl.dart';
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
  int totalPending = 0;
  List<Data2> cek = [];
  int? filterTanggal;
  String? filterJenis;
  String? filterStatus;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      cek.addAll(await state.getAllHistory(
        context,
        page,
        search: search,
        filter: filter,
      ));
      for (int i = 0; i < cek.length; i++) {
        if (cek[i].detail?.status == 'MENUNGGU_PEMBAYARAN') {
          totalPending += 1;
        }
        if (cek[i].detail?.status != 'MENUNGGU_PEMBAYARAN') {
          history.add(cek[i]);
        }
      }

      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          cek.clear();
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            cek.addAll(await state.getAllHistory(
              context,
              page,
              search: search,
              filter: filter,
            ));
            for (int i = 0; i < cek.length; i++) {
              if (cek[i].detail?.status == 'MENUNGGU_PEMBAYARAN') {
                totalPending += 1;
              }
              if (cek[i].detail?.status != 'MENUNGGU_PEMBAYARAN') {
                history.add(cek[i]);
              }
            }
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
                totalPending = 0;
                cek.clear();
                cek.addAll(
                  await state.getAllHistory(
                    context,
                    page,
                    search: search,
                    filter: filter,
                  ),
                );
                history.clear();
                for (int i = 0; i < cek.length; i++) {
                  if (cek[i].detail?.status == 'MENUNGGU_PEMBAYARAN') {
                    totalPending += 1;
                  }
                  if (cek[i].detail?.status != 'MENUNGGU_PEMBAYARAN') {
                    history.add(cek[i]);
                  }
                }
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
                        if (filter.isNotEmpty)
                          InkWell(
                            onTap: () async {
                              filterStatus = null;
                              filterTanggal = null;
                              filterJenis = null;
                              filter.clear();
                              page = 1;
                              totalPending = 0;
                              cek.clear();
                              setState(() {});
                              cek.addAll(
                                await state.getAllHistory(
                                  context,
                                  page,
                                  search: search,
                                  filter: filter,
                                ),
                              );
                              history.clear();
                              for (int i = 0; i < cek.length; i++) {
                                if (cek[i].detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  totalPending += 1;
                                }
                                if (cek[i].detail?.status !=
                                    'MENUNGGU_PEMBAYARAN') {
                                  history.add(cek[i]);
                                }
                              }
                              setState(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: greenColor,
                                ),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Icon(
                                Icons.close,
                                color: greenColor,
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            customeModal(context,
                                    FilterStatusTransaksi(val: filterStatus))
                                .then((value) async {
                              if (value == null) return;

                              filterStatus = value;
                              filter['transaction_status[]'] = value
                                  .toString()
                                  .toUpperCase()
                                  .replaceAll(' ', '_');
                              page = 1;
                              totalPending = 0;
                              cek.clear();
                              setState(() {});
                              cek.addAll(
                                await state.getAllHistory(
                                  context,
                                  page,
                                  search: search,
                                  filter: filter,
                                ),
                              );
                              history.clear();
                              for (int i = 0; i < cek.length; i++) {
                                if (cek[i].detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  totalPending += 1;
                                }
                                if (cek[i].detail?.status !=
                                    'MENUNGGU_PEMBAYARAN') {
                                  history.add(cek[i]);
                                }
                              }
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
                                color: (filterStatus is String)
                                    ? greenColor
                                    : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    filterStatus ?? 'Status Transaksi',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15,
                                      color: (filterStatus is String)
                                          ? greenColor
                                          : null,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: (filterStatus is String)
                                      ? greenColor
                                      : null,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            customeModal(context,
                                    FilterJenisTransaksi(val: filterJenis))
                                .then((value) async {
                              if (value == null) return;

                              filterJenis = value;
                              filter['transaction_type[]'] =
                                  value.toString().toUpperCase();
                              page = 1;
                              totalPending = 0;
                              cek.clear();
                              setState(() {});
                              cek.addAll(
                                await state.getAllHistory(
                                  context,
                                  page,
                                  search: search,
                                  filter: filter,
                                ),
                              );
                              history.clear();
                              for (int i = 0; i < cek.length; i++) {
                                if (cek[i].detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  totalPending += 1;
                                }
                                if (cek[i].detail?.status !=
                                    'MENUNGGU_PEMBAYARAN') {
                                  history.add(cek[i]);
                                }
                              }
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
                                color: (filterJenis is String)
                                    ? greenColor
                                    : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    filterJenis ?? 'Jenis Transaksi',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15,
                                      color: (filterJenis is String)
                                          ? greenColor
                                          : null,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: (filterJenis is String)
                                      ? greenColor
                                      : null,
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            customeModal(context,
                                    FilterTanggalTransaksi(val: filterTanggal))
                                .then((value) async {
                              if (value == null) return;

                              filterTanggal = value;
                              DateTime now = DateTime.now()
                                  .subtract(Duration(days: value));
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(now);
                              filter['start_date'] = formattedDate;
                              filter['end_date'] = DateTime.now();
                              page = 1;
                              totalPending = 0;
                              cek.clear();
                              setState(() {});
                              cek.addAll(
                                await state.getAllHistory(
                                  context,
                                  page,
                                  search: search,
                                  filter: filter,
                                ),
                              );
                              history.clear();
                              for (int i = 0; i < cek.length; i++) {
                                if (cek[i].detail?.status ==
                                    'MENUNGGU_PEMBAYARAN') {
                                  totalPending += 1;
                                }
                                if (cek[i].detail?.status !=
                                    'MENUNGGU_PEMBAYARAN') {
                                  history.add(cek[i]);
                                }
                              }
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
                                color: (filterTanggal is int)
                                    ? greenColor
                                    : borderColor,
                              ),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Row(
                              children: [
                                Center(
                                  child: Text(
                                    (filterTanggal is int)
                                        ? filterTanggal == 0
                                            ? 'Hari ini'
                                            : '$filterTanggal Hari yang lalu'
                                        : 'Tanggal Transaksi',
                                    style: blackRegulerTextStyle.copyWith(
                                      fontSize: 15,
                                      color: (filterTanggal is int)
                                          ? greenColor
                                          : null,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: (filterTanggal is int)
                                      ? greenColor
                                      : null,
                                )
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
        controller: scrollController,
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
                        totalPending == 0
                            ? Container()
                            : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: redColor),
                                child: Text(
                                  totalPending.toString(),
                                  style: whiteTextStyle.copyWith(fontSize: 10),
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
                      ? Padding(
                          padding: const EdgeInsets.only(top: 230),
                          child: Center(
                            child: Text(
                              'Belum ada transaksi',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      : Column(
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
                                    keluhan: history[index]
                                            .detail
                                            ?.medicalHistory
                                            ?.interestCondition
                                            ?.concern
                                            ?.name ??
                                        '-',
                                    harga: history[index].detail!.totalPaid!,
                                    img: history[index].detail?.consultation ==
                                            null
                                        ? '-'
                                        : '${Global.FILE}/${history[index].detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                                    doneReview: history[index]
                                                .detail
                                                ?.consultationReview ==
                                            null
                                        ? false
                                        : true,
                                    orderId:
                                        history[index].transactionId.toString(),
                                    paymentMethodId:
                                        history[index].detail!.paymentMethodId!,
                                    vaNumber:
                                        history[index].detail?.vaNumber ?? '-',
                                  );
                                }

                                if (history[index].transactionType ==
                                    'TREATMENT') {
                                  return TransaksiTreatment(
                                    item: history[index]
                                        .detail
                                        ?.transactionTreatmentItems,
                                    orderId:
                                        history[index].transactionId.toString(),
                                    tanggal: ConvertDate.defaultDate(
                                        history[index].createdAt ?? '-'),
                                    pesanan: 'Reservasi Treatment',
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
                                    harga: history[index].detail!.totalPaid!,
                                    doneReview: history[index]
                                                .detail!
                                                .transactionTreatmentItems?[0]
                                                .treatmentReview ==
                                            null
                                        ? false
                                        : true,
                                    paymentMethodId:
                                        history[index].detail!.paymentMethodId!,
                                    vaNumber:
                                        history[index].detail?.vaNumber ?? '-',
                                  );
                                }

                                if (history[index].transactionType ==
                                    'PRODUCT') {
                                  return TransaksiProduk(
                                    product: history[index].detail,
                                    orderId:
                                        history[index].transactionId.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}
