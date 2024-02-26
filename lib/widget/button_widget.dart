import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

class ButtonGreenWidget extends StatelessWidget {
  final String title;
  final Color color;
  final double height;
  final VoidCallback? onPressed;

  const ButtonGreenWidget({
    Key? key,
    required this.title,
    this.color = const Color(0xff24A7A0),
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: whiteColor,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}

class ButtonWhiteWidget extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const ButtonWhiteWidget({
    Key? key,
    required this.title,
    this.width = 340,
    this.height = 50,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          side: BorderSide(color: greenColor, width: 1),
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: greenColor,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}

class ButtonCostumWidget extends StatelessWidget {
  final double width;
  final double height;
  final String img;
  final Color colors;
  final Color? iconsColors;
  final VoidCallback? onPressed;

  const ButtonCostumWidget({
    Key? key,
    this.width = 340,
    this.height = 50,
    this.onPressed,
    required this.img,
    required this.colors,
    this.iconsColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            const EdgeInsets.only(left: 36, right: 36, top: 10, bottom: 10),
        height: 45,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: colors,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Image.asset(
          img,
          color: iconsColors,
        ),
      ),
    );
  }
}

class ButtonTextWidget extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const ButtonTextWidget({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 24,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: greyTextStyle.copyWith(
            fontSize: 16,
            color: greenColor,
          ),
        ),
      ),
    );
  }
}

class ButtonSignWidget extends StatelessWidget {
  final String img;
  final VoidCallback? onPressed;

  const ButtonSignWidget({
    Key? key,
    this.onPressed,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: InkWell(onTap: onPressed, child: Image.asset(img)),
        ),
      ],
    );
  }
}
