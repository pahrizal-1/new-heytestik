// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/home/home_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/stream/news_controller.dart';
import 'package:heystetik_mobileapps/controller/customer/transaction/order/order_consultation_controller.dart';
import 'package:heystetik_mobileapps/core/convert_date.dart';
import 'package:heystetik_mobileapps/models/customer/article_model.dart';
import 'package:heystetik_mobileapps/models/customer/banne_model.dart';
import 'package:heystetik_mobileapps/models/customer/snips_tips_model.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chat_page.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/select_conditions_page.dart';
import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/vies_detail_beauty_stream_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/icons_notifikasi.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/customer/account/profile_controller.dart';
import '../../controller/customer/notification/notification_controller.dart';
import '../../core/global.dart';
import '../setings&akun/akun_home_page.dart';
import '../tabbar/tabbar_customer.dart';

class HomepageCutomer extends StatefulWidget {
  const HomepageCutomer({super.key});

  @override
  State<HomepageCutomer> createState() => _HomepageCutomerState();
}

class _HomepageCutomerState extends State<HomepageCutomer> {
  final HomeController state = Get.put(HomeController());
  final ProfileController stateProfile = Get.put(ProfileController());
  final NewsController stateNews = Get.put(NewsController());
  final OrderConsultationController stateConcern =
      Get.put(OrderConsultationController());

  final NotificationCustomerController stateNotification =
      Get.put(NotificationCustomerController());

  _launchURL(String url) async {
    final Uri urlParse = Uri.parse(url);
    if (!await launchUrl(urlParse)) {
      throw Exception('Could not launch $urlParse');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.init();
      stateProfile.getProfile(context);
      stateConcern.getInterestConditions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilCustomerPage(),
                    ),
                  );
                },
                child: Obx(
                  () => Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: stateProfile.imgNetwork.value != ""
                            ? NetworkImage(
                                    '${Global.FILE}/${stateProfile.imgNetwork.value}')
                                as ImageProvider
                            : AssetImage('assets/images/profiledummy.png'),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Text(
                'Hai, ',
                style: blackRegulerTextStyle.copyWith(fontSize: 18),
              ),
              Obx(
                () => Text(
                  stateProfile.fullName.value,
                  style: blackTextStyle.copyWith(fontSize: 18),
                ),
              )
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              notificasion(context, '20', blackColor),
              const SizedBox(
                width: 21,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AkunHomePage(),
                    ),
                  );
                },
                child: SvgPicture.asset(
                  'assets/icons/humberger-icons.svg',
                ),
              ),
              const SizedBox(
                width: 26,
              )
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: state.getSlideShow(context),
            builder: (context, AsyncSnapshot<BannerModel?> snapshot) {
              print("DATA INI");
              print(snapshot.data);
              if (!snapshot.hasData) {
                return shimmerWidget(
                  child: CarouselSlider(
                    options: CarouselOptions(height: 184.0),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(7)),
                          );
                        },
                      );
                    }).toList(),
                  ),
                );
              }

              return snapshot.data!.data!.isEmpty
                  ? shimmerWidget(
                      child: CarouselSlider(
                        options: CarouselOptions(height: 184.0),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(7)),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    )
                  : CarouselSlider(
                      options: CarouselOptions(
                        height: 170,
                        autoPlay: false,
                        initialPage: 2,
                        autoPlayAnimationDuration: const Duration(seconds: 3),
                      ),
                      items: snapshot.data!.data!.map<Widget>((value) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                _launchURL(value.link.toString());
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage('assets/images/home1.png'),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: stateConcern.isLoading.value
                  ? shimmerWidget(
                      child: GridView.builder(
                        itemCount: 10,
                        padding: EdgeInsets.only(top: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          childAspectRatio: 1.0,
                          mainAxisSpacing: 5.0,
                          crossAxisSpacing: 5.0,
                        ),
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/kuninglangsat.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : GridView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.only(top: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 0.8,
                      ),
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (index == 9) {
                              Get.to(SelectConditionsPage());
                            } else {
                              Get.to(
                                ChatPage(
                                  interestConditionId:
                                      stateConcern.filterData[index].id,
                                  title: stateConcern.filterData[index].name ??
                                      '-',
                                ),
                              );
                            }
                          },
                          child: index == 9
                              ? Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/lainnya.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Lainnya',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'ProximaNova',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '${Global.FILE}/${stateConcern.filterData[index].mediaInterestCondition!.media!.path.toString()}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        stateConcern.filterData[index].name ??
                                            '-',
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
                        );
                      },
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Snips - Tips',
                    style: blackHigtTextStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 8),
              child: FutureBuilder(
                  future: state.getSnipsTips(context),
                  builder: (context, AsyncSnapshot<SnipsTipsModel?> snapshot) {
                    print(snapshot.data);

                    if (!snapshot.hasData) {
                      return shimmerWidget(
                          child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: greyColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 100,
                                width: 300,
                                decoration: BoxDecoration(
                                  color: greyColor.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    }
                    return snapshot.data!.data!.isEmpty
                        ? shimmerWidget(
                            child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, top: 5, bottom: 5),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: snapshot.data!.data!.map<Widget>((value) {
                              return InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 15,
                                              bottom: 17),
                                          height: 150,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                  'assets/icons/bg_wekkly.png',
                                                ),
                                                fit: BoxFit.fill),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: Image.asset(
                                                        'assets/icons/danger-icons.png',
                                                        width: 13,
                                                        height: 13,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  value.tips ?? '-',
                                                  style: TextStyle(
                                                    fontFamily: 'ProximaNova',
                                                    color: whiteColor,
                                                    fontWeight: regular,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      maxRadius: 17,
                                                      backgroundImage:
                                                          AssetImage(
                                                        'assets/images/profiledummy.png',
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 11,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          value.doctor
                                                                  ?.fullname ??
                                                              '-',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: whiteColor,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'ProximaNova',
                                                          ),
                                                        ),
                                                        Text(
                                                          value.doctorTitle ??
                                                              '-',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: whiteColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 16, bottom: 17),
                                  height: 130,
                                  width: 315,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/icons/bg_wekkly.png',
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.tips ?? '-',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          color: whiteColor,
                                          fontWeight: regular,
                                          fontSize: 13,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        softWrap: false,
                                        maxLines: 3,
                                        strutStyle: const StrutStyle(
                                          height: 0.5,
                                          leading: 0.5,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            maxRadius: 17,
                                            backgroundImage: AssetImage(
                                              'assets/images/profiledummy.png',
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 11,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.doctor?.fullname ?? '-',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: whiteColor,
                                                  fontSize: 14,
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              ),
                                              Text(
                                                value.doctorTitle ?? '-',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cek artikel yang kamu sukai, yuk!',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabBarCustomer(
                            currentIndex: 2,
                            streamIndex: 1,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: greenColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: FutureBuilder(
                future: stateNews.getArticle(context, '', ''),
                builder: (context, AsyncSnapshot<ArticleModel?> snapshot) {
                  if (!snapshot.hasData) {
                    return shimmerWidget(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  }
                  return snapshot.data!.record!.isEmpty
                      ? shimmerWidget(
                          child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int index = 0;
                                index < snapshot.data!.record!.length;
                                index++)
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    ViewDetailBeutyStreamPage(
                                      categoryId: snapshot
                                          .data!.record![index].newscategoryId
                                          .toString(),
                                      category: stateNews
                                          .categoryArticle[index].category
                                          .toString(),
                                      detailNews: snapshot.data!.record![index],
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                snapshot.data!.record![index]
                                                    .thumbLink
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            snapshot.data!.record![index].title
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'ProximaNova',
                                            ),
                                            strutStyle: StrutStyle(
                                              height: 0.5,
                                              leading: 0.7,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                ConvertDate.defaultDate(snapshot
                                                    .data!
                                                    .record![index]
                                                    .newsDate
                                                    .toString()),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/icons/dot.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.record![index].author
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot News 🔥',
                    style: blackHigtTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TabBarCustomer(
                            currentIndex: 2,
                            streamIndex: 1,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(
                          fontFamily: 'ProximaNova',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: greenColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: FutureBuilder(
                future: stateNews.getArticle(context, '', ''),
                builder: (context, AsyncSnapshot<ArticleModel?> snapshot) {
                  if (!snapshot.hasData) {
                    return shimmerWidget(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 300,
                              decoration: BoxDecoration(
                                color: greyColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
                  }
                  return snapshot.data!.record!.isEmpty
                      ? shimmerWidget(
                          child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 5, bottom: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 100,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int index = 0;
                                index < snapshot.data!.record!.length;
                                index++)
                              InkWell(
                                onTap: () {
                                  Get.to(
                                    ViewDetailBeutyStreamPage(
                                      categoryId: snapshot
                                          .data!.record![index].newscategoryId
                                          .toString(),
                                      category: stateNews
                                          .categoryArticle[index].category
                                          .toString(),
                                      detailNews: snapshot.data!.record![index],
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                snapshot.data!.record![index]
                                                    .thumbLink
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Text(
                                            snapshot.data!.record![index].title
                                                .toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'ProximaNova',
                                            ),
                                            strutStyle: StrutStyle(
                                              height: 0.5,
                                              leading: 0.7,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                ConvertDate.defaultDate(snapshot
                                                    .data!
                                                    .record![index]
                                                    .newsDate
                                                    .toString()),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Container(
                                                  height: 5,
                                                  width: 5,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        'assets/icons/dot.png',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.record![index].author
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'ProximaNova',
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
