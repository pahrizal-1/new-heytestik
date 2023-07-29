import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/notification/notification_controller.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../theme/theme.dart';
import '../../widget/appbar_widget.dart';

class NotifikasionPage extends StatefulWidget {
  const NotifikasionPage({super.key});

  @override
  State<NotifikasionPage> createState() => _NotifikasionPageState();
}

class _NotifikasionPageState extends State<NotifikasionPage> {
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
                const SizedBox(
                  height: 22,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 10,
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text("Category : ${state.notifications[index].data['category']}"),
                              Text("Topic : ${state.notifications[index].data['topic']}"),
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
