// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/chat/chat_controller.dart';
import 'package:heystetik_mobileapps/core/currency_format.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/pages/solution/solution_treatment_klinik_page.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/models/customer/detail_consultation_model.dart'
    as Detail;
import 'package:heystetik_mobileapps/widget/button_widget.dart';

Container ContainerSchedule = Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jane Cooper',
              style: TextStyle(
                  color: fromCssColor('#323232'),
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: fromCssColor('#1ACE42')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      '10:00 WIB',
                      style: TextStyle(
                        color: fromCssColor('#6B6B6B'),
                        fontFamily: 'ProximaNova',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Category: Face Concerns',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 11,
                    color: fromCssColor('#A3A3A3')),
              ),
            ),
            Text(
              'Topic: Acne Scars (Bopeng bekas jerawat)',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 11,
                  color: fromCssColor('#A3A3A3')),
            ),
          ],
        ),
        InkWell(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenColor,
            ),
            child: Center(
              child: Text(
                'Terima',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
);

Container ContainerDoctor = Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Padding(
    padding: const EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: fromCssColor('#1ACE42')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Jane Cooper',
                  style: TextStyle(
                      color: fromCssColor('#323232'),
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 15),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Jadwal: 24 Feb 2023 | 10:00 WIB',
                style: TextStyle(
                  color: fromCssColor('#6B6B6B'),
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Category: Face Concerns',
                style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 11,
                    color: fromCssColor('#A3A3A3')),
              ),
            ),
            Text(
              'Topic: Acne Scars (Bopeng bekas jerawat)',
              style: TextStyle(
                  fontFamily: 'ProximaNova',
                  fontSize: 11,
                  color: fromCssColor('#A3A3A3')),
            ),
          ],
        ),
        InkWell(
          child: Container(
            height: 35,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: greenColor,
            ),
            child: Center(
              child: Text(
                'Terima',
                style: TextStyle(
                  fontWeight: bold,
                  fontFamily: 'ProximaNova',
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ),
  ),
);

Container WidgetPhoto = Container(
  height: 150,
  width: 150,
  child: InkWell(
    onTap: () {},
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(10),
      color: fromCssColor('#CCCCCC'),
      strokeWidth: 1,
      child: Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/upload-cam.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 100),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Belum ada foto dari ‘My Journey’',
                    style: TextStyle(
                      fontFamily: 'ProximaNova',
                      color: fromCssColor('#9B9B9B'),
                      letterSpacing: 0.6,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  ),
);

class ContainerSettings extends StatelessWidget {
  final String title;
  final bool isLogout;
  const ContainerSettings({
    Key? key,
    required this.title,
    this.isLogout = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 0.2,
            blurRadius: 0.1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isLogout ? greenColor : null,
                fontSize: 15,
                letterSpacing: 0.2,
                fontFamily: 'ProximaNova',
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: isLogout ? greenColor : null,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerProdukSkicare extends StatefulWidget {
  int index;
  final Detail.ConsultationRecomendationSkincare data;
  ContainerProdukSkicare({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  State<ContainerProdukSkicare> createState() => _ContainerProdukSkicareState();
}

class _ContainerProdukSkicareState extends State<ContainerProdukSkicare> {
  final CustomerChatController state = Get.put(CustomerChatController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: fromCssColor(
            '#D9D9D9',
          ),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 17, right: 5, bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: InkWell(
                onTap: () {
                  state.onChecklistSkincare(widget.index, false);
                  setState(() {});
                },
                child: Container(
                  width: 23,
                  padding: const EdgeInsets.all(4),
                  height: 23,
                  decoration: BoxDecoration(
                    color: state.listSkincare[widget.index]['isSelected']
                        ? greenColor
                        : null,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: state.listSkincare[widget.index]['isSelected']
                          ? greenColor
                          : greyColor,
                    ),
                  ),
                  child: state.listSkincare[widget.index]['isSelected']
                      ? Image.asset('assets/icons/chek_new.png')
                      : null,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: fromCssColor('#E9E9E9')),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${Global.FILE}/${widget.data.product!.mediaProducts?[0].media?.path}'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: widget.data.product?.name ?? '-',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: greenColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penggunaan',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                fontSize: 12,
                                height: 1.3,
                                letterSpacing: 0.5,
                                color: fromCssColor(
                                  '#9B9B9B',
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 100),
                                  child: Text(
                                    widget.data.product?.skincareDetail
                                            ?.specificationHowToUse ??
                                        '-',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 12,
                                      height: 1.3,
                                      letterSpacing: 0.5,
                                      color: fromCssColor(
                                        '#9B9B9B',
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '0x sehari',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#9B9B9B',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          CurrencyFormat.convertToIdr(
                              widget.data.product?.price ?? 0, 0),
                          style: TextStyle(
                            fontFamily: 'ProximaNova',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            color: fromCssColor(
                              '#323232',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      width: 250,
                      height: 40,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Catatan',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: widget.data.product?.category ?? '',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                            color: fromCssColor('#A3A3A3'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: borderColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          if (state.listSkincare[widget.index]['qty'] > 1) {
                            state.decrement(widget.index, 'SKINCARE');
                            setState(() {});
                          }
                        },
                        child: Icon(
                          Icons.remove,
                          size: 15,
                          color: state.listSkincare[widget.index]['qty'] <= 1
                              ? greyColor
                              : greenColor,
                        ),
                      ),
                      const SizedBox(
                        width: 21,
                      ),
                      Text(state.listSkincare[widget.index]['qty'].toString()),
                      const SizedBox(
                        width: 21,
                      ),
                      InkWell(
                        onTap: () {
                          state.increment(widget.index, 'SKINCARE');
                          setState(() {});
                        },
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerProdukObat extends StatefulWidget {
  int index;
  final Detail.ConsultationRecipeDrug data;
  ContainerProdukObat({required this.index, required this.data, Key? key})
      : super(key: key);

  @override
  State<ContainerProdukObat> createState() => _ContainerProdukObatState();
}

class _ContainerProdukObatState extends State<ContainerProdukObat> {
  final CustomerChatController state = Get.put(CustomerChatController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: fromCssColor(
            '#D9D9D9',
          ),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 5, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: InkWell(
                    onTap: () {
                      state.onChecklistObat(widget.index, false);
                      setState(() {});
                    },
                    child: Container(
                      width: 23,
                      padding: const EdgeInsets.all(4),
                      height: 23,
                      decoration: BoxDecoration(
                        color: state.listObat[widget.index]['isSelected']
                            ? greenColor
                            : null,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: state.listObat[widget.index]['isSelected']
                              ? greenColor
                              : greyColor,
                        ),
                      ),
                      child: state.listObat[widget.index]['isSelected']
                          ? Image.asset('assets/icons/chek_new.png')
                          : null,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: fromCssColor('#E9E9E9')),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  '${Global.FILE}/${widget.data.product!.mediaProducts?[0].media?.path}'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  text: widget.data.product?.name ?? '-',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    color: greenColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    height: 1.1,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Penggunaan',
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 12,
                                    height: 1.3,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#9B9B9B',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 100),
                                      child: Text(
                                        widget.data.product?.drugDetail
                                                ?.specificationDose ??
                                            '-',
                                        style: TextStyle(
                                          fontFamily: 'ProximaNova',
                                          fontSize: 12,
                                          height: 1.3,
                                          letterSpacing: 0.5,
                                          color: fromCssColor(
                                            '#9B9B9B',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '0x sehari',
                                      style: TextStyle(
                                        fontFamily: 'ProximaNova',
                                        fontSize: 12,
                                        height: 1.3,
                                        letterSpacing: 0.5,
                                        color: fromCssColor(
                                          '#9B9B9B',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  CurrencyFormat.convertToIdr(
                                      widget.data.product?.price ?? 0, 0),
                                  style: TextStyle(
                                    fontFamily: 'ProximaNova',
                                    fontSize: 13,
                                    fontWeight: bold,
                                    letterSpacing: 0.5,
                                    color: fromCssColor(
                                      '#323232',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 100),
                                  child: Text(
                                    '1 (${widget.data.product?.drugDetail?.specificationPackaging})',
                                    style: TextStyle(
                                      fontFamily: 'ProximaNova',
                                      fontSize: 13,
                                      fontWeight: bold,
                                      letterSpacing: 0.5,
                                      color: fromCssColor(
                                        '#323232',
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 250,
                      height: 40,
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Catatan',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: greenColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: widget.data.notes ?? '-',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                            color: fromCssColor('#A3A3A3'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: borderColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              if (state.listObat[widget.index]['qty'] > 1) {
                                state.decrement(widget.index, 'OBAT');
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.remove,
                              size: 15,
                              color: state.listObat[widget.index]['qty'] <= 1
                                  ? greyColor
                                  : greenColor,
                            ),
                          ),
                          const SizedBox(
                            width: 21,
                          ),
                          Text(state.listObat[widget.index]['qty'].toString()),
                          const SizedBox(
                            width: 21,
                          ),
                          InkWell(
                            onTap: () {
                              state.increment(widget.index, 'OBAT');
                              setState(() {});
                            },
                            child: Icon(
                              Icons.add,
                              size: 15,
                              color: greenColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              transform: Matrix4.translationValues(-12, -10, 0),
              width: 82,
              height: 35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/icons/penting.png'),
                    fit: BoxFit.fill),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerTreatment extends StatelessWidget {
  final Detail.ConsultationRecomendationTreatment data;
  const ContainerTreatment({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: fromCssColor(
            '#D9D9D9',
          ),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 17, right: 10, bottom: 15, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: fromCssColor('#E9E9E9')),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              '${Global.FILE}/${data.consultationRecomendationTreatmentClinics?[0].clinic!.mediaClinics?[0].media?.path}'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: RichText(
                            text: TextSpan(
                              text: data.name ?? '-',
                              style: TextStyle(
                                fontFamily: 'ProximaNova',
                                color: greenColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              child: Text(
                                'Cost',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: 0.5,
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 70),
                              child: Text(
                                data.cost ?? '-',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: 0.5,
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              child: Text(
                                'Recov. Time',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: 0.5,
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 70),
                              child: Text(
                                data.recoveryTime ?? '-',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: 0.5,
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 75,
                              child: Text(
                                'Type',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: 0.5,
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              constraints: BoxConstraints(maxWidth: 70),
                              child: Text(
                                data.type ?? '-',
                                style: TextStyle(
                                  fontFamily: 'ProximaNova',
                                  fontSize: 12,
                                  height: 1.3,
                                  letterSpacing: 0.5,
                                  color: fromCssColor(
                                    '#9B9B9B',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Container(
              height: 40,
              child: ButtonGreenWidget(
                title: 'Cari & Pilih Klinik',
                onPressed: () {
                  Get.to(() => const TreatmentKlink());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
