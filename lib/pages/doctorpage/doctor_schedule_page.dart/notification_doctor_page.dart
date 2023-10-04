import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/models/customer/notification.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../widget/loading_widget.dart';

class NotificationDoctorPage extends StatefulWidget {
  const NotificationDoctorPage({super.key});

  @override
  State<NotificationDoctorPage> createState() => _NotificationDoctorPageState();
}

class _NotificationDoctorPageState extends State<NotificationDoctorPage> {
  final NotificationCustomerController state =
      Get.put(NotificationCustomerController());
  final ScrollController controller = ScrollController();
  int page = 1;
  List<DataNotificationCustomerModel> notifications = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      state.getNotificationDoctor(context, page);
      // notifications.addAll(await state.getNotification(context, page));
      setState(() {});
    });
    controller.addListener(() {
      if (controller.offset == controller.position.maxScrollExtent) {
        page += 1;
        // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        //   // notifications.addAll(await state.getNotification(context, page));
        //   state.getNotificationDoctor(context, page);
        //   setState(() {});
        // });
      } else {
        page -= 1;
        // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        //   // notifications.addAll(await state.getNotification(context, page));
        //   state.getNotificationDoctor(context, page);
        //   setState(() {});
        // });
      }
    });
    // controller.addListener(() {
    //   if (controller.position.atEdge) {
    //     bool isTop = controller.position.pixels == 0;
    //     if (!isTop) {
    //       page += 1;
    //       WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //         // notifications.addAll(await state.getNotification(context, page));
    //         state.getNotificationDoctor(context, page);
    //         setState(() {});
    //       });
    //     } else {
    //       page -= 1;
    //       WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //         // notifications.addAll(await state.getNotification(context, page));
    //         state.getNotificationDoctor(context, page);
    //         setState(() {});
    //       });
    //     }
    //   }
    // },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: greenColor,
        title: Text(
          "Notifikasi",
          style: TextStyle(
              letterSpacing: 1.5,
              fontFamily: 'ProximaNova',
              fontWeight: bold,
              color: whiteColor),
        ),
      ),
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: state.notif.isNotEmpty ? ListView.builder(
            itemCount: state.notif.length,
            controller: controller,
            itemBuilder: (context, index) {
              print('list ' + state.notif.toString());
              return Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.notif[index]['type'] == 'CONSULTATION_REVIEW')
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.notif[index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 8.0,
                                // ),
                                // Text(
                                //   state.notif[index]['body'],
                                //   style: TextStyle(
                                //     color: Colors.grey,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            timeago.format(DateTime.parse(
                                state.notif[index]['created_at'])),
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
          
                    if (state.notif[index]['type'] ==
                        'CONSULTATION_DOCTOR_SCHEDULE')
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 30.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.05),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        state.notif[index]['data']
                                            ['customer_name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    "Jadwal : ${DateFormat('dd MMMM yyyy | hh:mm').format(DateTime.parse(state.notif[index]['data']['schedule_date']))}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Category : ${state.notif[index]['data']['category']}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    "Topic : ${state.notif[index]['data']['topic']}",
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
                            InkWell(
                              onTap: () {
                                state.postApprove(
                                    context,
                                    state.notif[index]['data']
                                        ['consultation_doctor_schedule_id']);
                                // Navigator.pop(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF24A7A0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 8.0,
                                ),
                                child: Text(
                                  "Terima",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    // if (notifications[index].type != "GENERAL")
                    //   const SizedBox(
                    //     height: 16.0,
                    //   ),
                    dividergrey(),
                  ],
                ),
              );
            },
          ) : Center(child: Text('No Notifications'),)
        ),
      ),
    );
  }
}
