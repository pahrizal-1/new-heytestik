import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/pages/chat_customer/chat_page.dart';
import '../../theme/theme.dart';
import '../../widget/text_form_widget.dart';

class SelectConditionsPage extends StatelessWidget {
  const SelectConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        backgroundColor: greenColor,
        title: Row(
          children: const [
            Text('Pilih Kodisi'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                title: 'Cari Kodisi',
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Korektif Wajah',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 18,
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Berawat',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'kusam',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Bekas Jerawat',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Korektif Wajah',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 18,
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'Augmentation Wajah & Tubuh',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(
                height: 18,
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
              const KorektifWajahPage(
                title: 'Bekas Flek Hitam & Melasma',
                img: 'assets/images/pelkhitam.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KorektifWajahPage extends StatelessWidget {
  final String title;
  final String img;
  const KorektifWajahPage({
    super.key,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatPage(),
            ),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 47,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        img,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  title,
                  style: blackTextStyle,
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward,
                ),
              ],
            ),
            Divider(
              color: greyColor,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
