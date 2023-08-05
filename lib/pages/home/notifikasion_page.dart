import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
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
  final NotificationCustomerController state = Get.put(NotificationCustomerController());
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
            notifications.addAll(await state.getNotification(context, page));
          });
          setState(() {});
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
      body: ListView.builder(
        itemCount: notifications.length,
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
                      timeago.format(DateTime.parse(notifications[index].createdAt)),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                if (notifications[index].type == "TRANSACTION_CONSULTATION_SUCCESS" || notifications[index].type == 'CHAT')
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabBarCustomer(currentIndex: 1),
                        ),
                      );
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
                        "Chat Dokter",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (notifications[index].type == 'CONSULTATION_DOCTOR_SCHEDULE')
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 10,
                      )
                    ]),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("Category : ${notifications[index].data['category']}"),
                              Text("Topic : ${notifications[index].data['topic']}"),
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
                if (notifications[index].type != "GENERAL")
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
