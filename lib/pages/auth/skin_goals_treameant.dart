import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/controller/customer/interest/interest_controller.dart';
import 'package:heystetik_mobileapps/widget/button_widget.dart';
import 'package:heystetik_mobileapps/widget/drop_dow_widget.dart';
import 'package:heystetik_mobileapps/widget/more_dialog_widget.dart';
import 'package:provider/provider.dart';

import '../../theme/theme.dart';
import '../../widget/timeline_widget.dart';

class SkinGoalsEmpat extends StatefulWidget {
  const SkinGoalsEmpat({super.key});

  @override
  State<SkinGoalsEmpat> createState() => _SkinGoalsSatuState();
}

class _SkinGoalsSatuState extends State<SkinGoalsEmpat> {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<InterestController>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icons/danger-icons.png',
                width: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: true,
                  title: 'Nomor Hanpone',
                  img: 'assets/icons/iphone1.png',
                  width: 15,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Email',
                  img: 'assets/icons/email-icons.png',
                  width: 25,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Info Personal',
                  img: 'assets/images/iphone1.png',
                  width: 25,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: whiteColor,
                  secondiconColor: greenColor,
                  bgcolor: greenColor,
                  isFirst: false,
                  isLast: false,
                  title: 'Beauty Profile',
                  img: 'assets/icons/logo-person.png',
                  width: 20,
                  iconimg: 'assets/images/check.png',
                ),
                TimeLineIdicatorPage(
                  iconColor: greenColor,
                  secondiconColor: greenColor,
                  bgcolor: whiteColor,
                  isFirst: false,
                  isLast: true,
                  title: 'Skin Goals',
                  img: 'assets/icons/logo-person.png',
                  width: 20,
                  iconimg: 'assets/images/Vector.png',
                ),
              ],
            ),
            const SizedBox(
              height: 23,
            ),
            const Divider(
              thickness: 1,
              color: Color(0XffCCCCCC),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: lsymetric,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skin Goals',
                    style: blackHigtTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Anggaran Untuk Skincare',
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Kira-kira berapa budget yang kamu siapkan untuk membeli skincare-mu?',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const DropDownWiget(
                    type: 1,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Anggaran Untuk Treatment',
                    style: blackTextStyle.copyWith(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Kira-kira berapa budget yang kamu siapkan untuk melakukan treatment di klinik?',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const DropDownWiget(
                    type: 2,
                  ),
                  const SizedBox(
                    height: 211,
                  ),
                  ButtonGreenWidget(
                    title: 'Simpan',
                    onPressed: () async {
                      await state.budgets(context, doInPost: () async {
                        showDialog(
                          context: context,
                          builder: (context) => const ProfilMoreDialog(),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
