// import 'package:flutter/material.dart';

// import '../../../../theme/theme.dart';
// import '../../../../widget/card_skincare.dart';

// class TambahanSkinCare2 extends StatefulWidget {
//   const TambahanSkinCare2({super.key});

//   @override
//   State<TambahanSkinCare2> createState() => _TambahanSkinCare2State();
// }

// class _TambahanSkinCare2State extends State<TambahanSkinCare2> {
//   List img = [
//     'assets/images/penting1.png',
//     'assets/images/penting2.png',
//   ];
//   List name = [
//     'Teenderm gel sensitive 150 ml',
//     'Teenderm Aqua 200 ml',
//   ];
//   List harga = [
//     'Rp250.000',
//     'Rp150.000',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       top: 150,
//       left: 0,
//       right: 0,
//       bottom: 0,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 22, right: 22),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(
//               height: 12,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 2,
//               itemBuilder: (BuildContext context, int index) {
//                 return CardSkincarePrice(
//                     nameTitle: name[index],
//                     urlImg: img[index],
//                     subTitle: 'Cleanser',
//                     harga: harga[index],
//                     pengguna: 'Pagi&Malam');
//               },
//             ),
//             Divider(
//               thickness: 2,
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Text(
//               'Toner',
//               style: blackTextStyle.copyWith(fontSize: 15),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 1,
//               itemBuilder: (BuildContext context, int index) {
//                 return CardSkincarePrice(
//                     nameTitle: name[index],
//                     urlImg: img[index],
//                     subTitle: 'Cleanser',
//                     harga: 'Rp150.000',
//                     pengguna: 'Pagi&Malam');
//               },
//             ),
//             Divider(
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Text(
//               'Acne Cream',
//               style: blackTextStyle.copyWith(fontSize: 15),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 1,
//               itemBuilder: (BuildContext context, int index) {
//                 return CardSkincarePrice(
//                     nameTitle: name[index],
//                     urlImg: img[index],
//                     subTitle: 'Cleanser',
//                     harga: 'Rp150.000',
//                     pengguna: 'Pagi&Malam');
//               },
//             ),
//             Divider(
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Text(
//               'Moisturizer',
//               style: blackTextStyle.copyWith(fontSize: 15),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 2,
//               itemBuilder: (BuildContext context, int index) {
//                 return CardSkincarePrice(
//                     nameTitle: name[index],
//                     urlImg: img[index],
//                     subTitle: 'Cleanser',
//                     harga: 'Rp150.000',
//                     pengguna: 'Pagi&Malam');
//               },
//             ),
//             Divider(
//               thickness: 1,
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Text(
//               'Acne Spot',
//               style: blackTextStyle.copyWith(fontSize: 15),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 1,
//               itemBuilder: (BuildContext context, int index) {
//                 return CardSkincarePrice(
//                     nameTitle: name[index],
//                     urlImg: img[index],
//                     subTitle: 'Cleanser',
//                     harga: 'Rp150.000',
//                     pengguna: 'Pagi&Malam');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
