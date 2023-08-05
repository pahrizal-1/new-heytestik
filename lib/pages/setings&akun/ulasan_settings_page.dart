import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/account/review_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/setings&akun/tulis_ulasan_page.dart';
import 'package:heystetik_mobileapps/models/customer/waiting_review_model.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../../widget/ulasan_riwayat_widgets.dart';
import '../../widget/ulasan_widgets.dart';
import 'detail_ulasan_page.dart';

class UlasanSetingsPage extends StatefulWidget {
  const UlasanSetingsPage({super.key});

  @override
  State<UlasanSetingsPage> createState() => _UlasanSetingsPageState();
}

class _UlasanSetingsPageState extends State<UlasanSetingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          titleSpacing: 0,
          iconTheme: iconthemeblack(),
          backgroundColor: whiteColor,
          title: Text(
            'Ulasan',
            style: blackTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 40,
                child: TabBar(
                  isScrollable: true,
                  labelColor: greenColor,
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  unselectedLabelColor: subTitleColor,
                  labelStyle: blackHigtTextStyle.copyWith(
                    fontSize: 15,
                    color: const Color(0XFF9B9B9B),
                  ),
                  indicator: BoxDecoration(
                    border: Border.all(
                      color: greenColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  tabs: const [
                    Tab(
                      text: 'Menunggu diulas (3)',
                    ),
                    Tab(
                      text: 'Riwayat',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            dividergreen(),
            Expanded(
              child: TabBarView(
                children: [
                  MenungguUlasan(),
                  RiwayatUlasan(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RiwayatUlasan extends StatefulWidget {
  const RiwayatUlasan({
    super.key,
  });

  @override
  State<RiwayatUlasan> createState() => _RiwayatUlasanState();
}

class _RiwayatUlasanState extends State<RiwayatUlasan> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextUlasanRiwayat(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailPageUlasan()));
            },
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bulan lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
          const TextUlasanRiwayat(
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bulan lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
          const TextUlasanRiwayat(
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bul an lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
          const TextUlasanRiwayat(
            nameBrand: 'ISISPHARMA',
            nameProduk: 'Teenderm Hydra 40ml',
            waktu: '1 bulan lalu',
            coment:
                'Makasih buat dokter dan beautician nya yang ramah. Puas banget perawatan disini, jerawatku makin sirnaaaa.',
            balasan: 'Ada 1 balasan',
          ),
        ],
      ),
    );
  }
}

class MenungguUlasan extends StatefulWidget {
  MenungguUlasan({super.key});

  @override
  State<MenungguUlasan> createState() => _MenungguUlasanState();
}

class _MenungguUlasanState extends State<MenungguUlasan> {
  final ReviewController state = Get.put(ReviewController());

  final ScrollController scrollController = ScrollController();

  List<Data2> waitingReview = [];

  int page = 1;

  int isSelected = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      waitingReview.addAll(await state.waitingReview(context, page));
      setState(() {});
    });

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            waitingReview.addAll(await state.waitingReview(context, page));
            setState(() {});
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: waitingReview.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada data',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: waitingReview.length,
                    itemBuilder: (BuildContext context, index) {
                      if (waitingReview[index].transactionType ==
                          'CONSULTATION') {
                        return UlasanProudukKonsultasi(
                          onPressed: () {
                            Get.to(TulisUlasaPage());
                          },
                          nameProduk: 'nama prod',
                          tanggal: ConvertDate.defaultDate(
                              waitingReview[index].createdAt ?? '-'),
                          // titleButton: 'Beli Lagi',
                          img: waitingReview[index].detail?.consultation == null
                              ? '-'
                              : '${Global.FILE}/${waitingReview[index].detail?.consultation?.doctor!.mediaUserProfilePicture?.media?.path}',
                          namabrand: 'Teenderm Hydra 40ml',
                        );
                      }
                      if (waitingReview[index].transactionType == 'TREATMENT') {
                        return UlasanProudukTreatment(
                          onPressed: () {
                            Get.to(TulisUlasaPage());
                          },
                          item: waitingReview[index]
                              .detail
                              ?.treatment
                              ?.mediaTreatments,
                          nameProduk:
                              waitingReview[index].detail?.treatment?.name ??
                                  '-',
                          tanggal: ConvertDate.defaultDate(
                              waitingReview[index].createdAt ?? '-'),
                          // titleButton: 'Beli Lagi',
                          // img: 'assets/images/penting1.png',
                          klinik: waitingReview[index]
                                  .detail
                                  ?.treatment
                                  ?.clinic
                                  ?.name ??
                              '-',
                        );
                      }
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
  // const UlasanProuduk(
                          //   nameProduk: 'Peeling TCA Ringan',
                          //   tanggal: '12 Jun 2023',
                          //   titleButton: 'Beli Lagi',
                          //   img: 'assets/images/treat1.png',
                          //   namabrand: 'Klinik Utama Lithea',
                          // ),
                          // const UlasanProuduk(
                          //   nameProduk: 'dr. Risty Hafinah, Sp.DV',
                          //   tanggal: '12 Jun 20023',
                          //   titleButton: 'Beli Lagi',
                          //   img: 'assets/images/doctor-img.png',
                          //   namabrand: 'Konsultasi',
                          // ),
                          // const UlasanProuduk(
                          //   nameProduk: 'dr. Risty Hafinah, Sp.DV',
                          //   tanggal: '12 Jun 20023',
                          //   titleButton: 'Beli Lagi',
                          //   img: 'assets/images/doctor-img.png',
                          //   namabrand: 'Konsultasi',
                          // ),
                          // const UlasanProuduk(
                          //   nameProduk: 'dr. Risty Hafinah, Sp.DV',
                          //   tanggal: '12 Jun 20023',
                          //   titleButton: 'Beli Lagi',
                          //   img: 'assets/images/doctor-img.png',
                          //   namabrand: 'Konsultasi',
                          // ),