import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';
import 'package:heystetik_mobileapps/widget/container_widget.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationDoctorPage extends StatefulWidget {
  const NotificationDoctorPage({super.key});

  @override
  State<NotificationDoctorPage> createState() => _NotificationDoctorPageState();
}

class _NotificationDoctorPageState extends State<NotificationDoctorPage> {
  final NotificationCustomerController state = Get.put(NotificationCustomerController());
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (!isTop) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            state.getNotification(context, 1);
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
        backgroundColor: greenColor,
        title: Text(
          "Notifikasi",
          style: TextStyle(letterSpacing: 1.5, fontFamily: 'ProximaNova', fontWeight: bold, color: whiteColor),
        ),
      ),
      body: ListView.builder(
        itemCount: state.notifications.length,
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.notifications[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            state.notifications[index].body,
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
                      timeago.format(DateTime.parse(state.notifications[index].createdAt)),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                if (state.notifications[index].type == "TRANSACTION_CONSULTATION_SUCCESS" || state.notifications[index].type == 'CHAT')
                  Container(
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
                if (state.notifications[index].type == 'CONSULTATION_DOCTOR_SCHEDULE')
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
                                  Text(state.notifications[index].data['customer_name'], style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),)
                                ],
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Jadwal : ${DateFormat('dd MMMM yyyy | hh:mm').format(DateTime.parse(state.notifications[index].data['schedule_date']))}",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Category : ${state.notifications[index].data['category']}",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Topic : ${state.notifications[index].data['topic']}",
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
                        Container(
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
                      ],
                    ),
                  ),
                if(state.notifications[index].type != "GENERAL")
                  const SizedBox(
                    height: 16.0,
                  ),
                dividergrey(),
              ],
            ),
          );
        },
      ),
    );
  }
}
