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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
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
                                        Text(
                                          'Balasan Cepat',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(
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
                                  const SizedBox(
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
                                        Text(
                                          'Catatan Dokter &\nRekomendasi',
                                          style: blackRegulerTextStyle.copyWith(
                                              fontSize: 13),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 44,
                                          width: 44,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration: BoxDecoration(
                                              color: greenColor,
                                              shape: BoxShape.circle),
                                          child: Image.asset(
                                            'assets/icons/book1.png',
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

class ChatBottomCostomer extends StatelessWidget {
  const ChatBottomCostomer({
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
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        'assets/icons/plus-icosn.png',
                        width: 16,
                      ),
                    ),
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
