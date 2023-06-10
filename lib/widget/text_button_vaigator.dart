import 'package:flutter/material.dart';

import '../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/balasan_chat_page.dart';
import '../pages/doctorpage/doctor_schedule_page.dart/chat_doctor/catatan_produck_doctor_page.dart';
import '../theme/theme.dart';

class ChatBottomNavigator extends StatelessWidget {
  const ChatBottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10000)),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0,
                      ),
                    ),
                    fillColor: whiteColor,
                    hintText: 'Messeges',
                    suffixIcon: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: PopupMenuButton(
                          icon: Image.asset(
                            'assets/icons/atement.png',
                            width: 20,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: Container(
                              height: 100,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BalasanCepatPage(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text('Balasan Cepat'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/lighr.png',
                                            color: whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CatatanDocter(),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Text('Catatan Dokter &\nRekomendasi'),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/book.png',
                                            color: whiteColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        )),
                    hintStyle: subGreyTextStyle,
                  ),
                ),
              ),
              Image.asset(
                'assets/icons/Group 461.png',
                width: 40,
              )
            ],
          ),
        ));
  }
}
