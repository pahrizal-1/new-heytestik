import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

Color whiteColor = const Color(0xffFFFFFF);
Color greenColor = const Color(0xff24A7A0);
Color blackColor = const Color(0xff323232);
Color redColor = const Color(0xffEB4335);
Color blueColor = const Color(0xff1877F2);
Color yellowColor = const Color(0xffFFC36A);
Color greyColor = const Color(0xff6B6B6B);
Color subgreyColor = const Color(0xff575757);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

const double paddingL = 25;

const double spaceWidth = 15;
const double spaceHeigt = 15;
const EdgeInsets onboardingheader =
    EdgeInsets.only(top: 60, bottom: 60, left: 22, right: 24);
const EdgeInsets kRegularPadding = EdgeInsets.all(20);
const EdgeInsets kTopPadding = EdgeInsets.only(top: 10);
const EdgeInsets lsymetric = EdgeInsets.only(left: 25, right: 25);

TextStyle grenTextStyle = TextStyle(
  color: greenColor,
  fontSize: 30,
  fontFamily: 'proxima-nova',
  fontWeight: bold,
);

TextStyle subGreyTextStyle = TextStyle(
  color: subgreyColor,
  fontSize: 14,
  fontFamily: 'proxima-nova',
  fontWeight: medium,
);

TextStyle whiteTextStyle = TextStyle(
  color: whiteColor,
  fontSize: 12,
  fontFamily: 'proxima-nova',
  fontWeight: medium,
);

TextStyle greyTextStyle = TextStyle(
  color: greyColor,
  fontSize: 12,
  fontFamily: 'proxima-nova',
  fontWeight: medium,
);

TextStyle blackTextStyle = TextStyle(
  color: blackColor,
  fontSize: 12,
  fontFamily: 'proxima-nova',
  fontWeight: bold,
);
TextStyle blackHigtTextStyle = TextStyle(
  color: blackColor,
  fontSize: 24,
  fontFamily: 'proxima-nova',
  fontWeight: bold,
);
