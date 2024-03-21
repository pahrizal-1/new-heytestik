import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/pages/stream_page/komentar_stream_page.dart';
import 'package:heystetik_mobileapps/pages/stream_page/user_followed_stream_page.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../models/customer/notification.dart';
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';
import '../tabbar/tabbar_customer.dart';

class NotifikasionPage extends StatefulWidget {
  const NotifikasionPage({super.key});

  @override
  State<NotifikasionPage> createState() => _NotifikasionPageState();
}

class _NotifikasionPageState extends State<NotifikasionPage> {
  final NotificationController state = Get.put(NotificationController());
  final ScrollController controller = ScrollController();
  int page = 1;
  List<DataNotificationCustomerModel> notifications = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      notifications.addAll(await state.getNotification(context, page));
      setState(() {});
    });

    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (!isTop) {
          page += 1;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            state.isLoadingMore.value = true;
            notifications.addAll(await state.getNotification(context, page));
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
      backgroundColor: const Color(0XfFFFFFFf),
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Text(
          'Notifikasi',
          style: whiteTextStyle.copyWith(
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoadingMore.value ? false : state.isLoading.value,
          child: (notifications.isEmpty)
              ? Center(
                  child: Text(
                    'Belum ada data',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: notifications.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (notifications[index].type == "GENERAL") {
                          print("GENERAL");
                        } else if (notifications[index].type ==
                            "TRANSACTION_CONSULTATION_SUCCESS") {
                          print("TRANSACTION_CONSULTATION_SUCCESS");
                          Get.to(() => const TabBarCustomer(currentIndex: 1));
                        } else if (notifications[index].type == "CHAT") {
                          print("CHAT");
                          Get.to(() => const TabBarCustomer(currentIndex: 1));
                        } else if (notifications[index].type ==
                            "STREAM_NEW_FOLLOWER") {
                          Get.to(
                            () => UserFollowedStreamPage(
                              username: notifications[index]
                                  .data['follower_username']
                                  .toString(),
                              fullname: notifications[index]
                                  .data['follower_username']
                                  .toString(),
                            ),
                          );
                        } else if (notifications[index].type == "STREAM_LIKE" ||
                            notifications[index].type == "STREAM_COMMENT" ||
                            notifications[index].type ==
                                "STREAM_COMMENT_LIKE" ||
                            notifications[index].type ==
                                "STREAM_COMMENT_REPLY" ||
                            notifications[index].type ==
                                "STREAM_COMMENT_REPLY_LIKE" ||
                            notifications[index].type == "STREAM_VOTE" ||
                            notifications[index].type ==
                                "STREAM_USER_ACTIVITY") {
                          print(notifications[index].type);
                          Get.to(
                            () => KomentarStreamPage(
                              postId: int.parse(
                                notifications[index]
                                    .data['stream_id']
                                    .toString(),
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: index == 0 ? 16 : 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notifications[index].title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        notifications[index].body,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  timeago.format(DateTime.parse(
                                      notifications[index].createdAt)),
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            if (notifications[index].type ==
                                    "TRANSACTION_CONSULTATION_SUCCESS" ||
                                notifications[index].type == 'CHAT')
                              InkWell(
                                onTap: () {
                                  Get.to(() =>
                                      const TabBarCustomer(currentIndex: 1));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    bottom: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF24A7A0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    "Chat Dokter",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            dividergrey(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
