import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class TextFormWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const TextFormWidget({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: blackTextStyle),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: greenColor,
            hoverColor: greenColor,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: greenColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}

class BorderFormText extends StatelessWidget {
  final String hintText;
  const BorderFormText({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: greenColor,
            ),
          ),
          focusColor: greenColor,
          labelStyle: blackTextStyle),
    );
  }
}

class SkinGoalsFrom extends StatefulWidget {
  const SkinGoalsFrom({
    Key? key,
  }) : super(key: key);

  @override
  State<SkinGoalsFrom> createState() => _SkinGoalsFromState();
}

class _SkinGoalsFromState extends State<SkinGoalsFrom> {
  bool isIconSelected1 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isIconSelected1 = !isIconSelected1;
            });
          },
          child: Container(
            decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: isIconSelected1 ? greenColor : whiteColor)),
            height: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isIconSelected1 ? Icons.check_circle_rounded : Icons.add_circle,
                      size: 18,
                      color: isIconSelected1 ? greenColor : greyColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Acne',
                      style: TextStyle(letterSpacing: 0.5, fontSize: 12, fontFamily: 'ProximaNova', color: isIconSelected1 ? greenColor : greyColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xfffF1F1F1),
        hintText: "Cari Kondisi",
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
