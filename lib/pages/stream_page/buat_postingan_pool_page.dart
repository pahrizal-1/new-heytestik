// import 'package:flutter/material.dart';
// import 'package:from_css_color/from_css_color.dart';
// import 'package:get/get.dart';
// import 'package:heystetik_mobileapps/controller/customer/stream/post_controller.dart';
// import 'package:heystetik_mobileapps/core/local_storage.dart';
// import 'package:heystetik_mobileapps/models/customer/stream_post.dart';
// import 'package:heystetik_mobileapps/widget/filter_publish_widgets.dart';
// import 'package:heystetik_mobileapps/widget/show_modal_dialog.dart';

// import '../../theme/theme.dart';
// import '../../widget/text_form_widget.dart';

// class BuatPostingaPollPage extends StatefulWidget {
//   const BuatPostingaPollPage({super.key});

//   @override
//   State<BuatPostingaPollPage> createState() => _BuatPostingaPollPageState();
// }

// class _BuatPostingaPollPageState extends State<BuatPostingaPollPage> {
//   final TextEditingController postDescController = TextEditingController();
//   final TextEditingController hashTagController = TextEditingController();
//   final StreamController streamController = Get.put(StreamController());
//   String name = '-';
//   final List<TextEditingController> optionController = [
//     TextEditingController(),
//     TextEditingController(),
//   ];
//   final DateTime endDate = DateTime.now();
//   int days = 1;
//   Map visibility = {'visibility': 'PUBLIC', 'title': 'Semua Orang'};

//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
//       name = await LocalStorage().getFullName();
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.transparent,
//         title: Padding(
//           padding: const EdgeInsets.only(left: 6),
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: blackColor,
//                 ),
//               ),
//               const SizedBox(
//                 width: 11,
//               ),
//               Text(
//                 'Buat Postingan',
//                 style: blackHigtTextStyle.copyWith(fontSize: 20),
//               ),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () {
//                   RegExp hashtagRegExp = RegExp(r'\B#\w+');
//                   Iterable<Match> matches =
//                       hashtagRegExp.allMatches(hashTagController.text);
//                   List<String?> hashtags = matches.map((match) {
//                     String? hashtagText =
//                         match.group(0)?.substring(1); // Remove the '#' symbol
//                     return hashtagText?.replaceAll(' ', '');
//                   }).toList();

//                   StreamPostModel postModel = StreamPostModel(
//                     content: postDescController.text,
//                     // type: 'POLLING',
//                     hashtags: hashtags,
//                     endTime: DateTime.now().add(Duration(days: days)),
//                     options: optionController.map((e) => e.text).toList(),
//                     visibility: visibility['visibility'].toString(),
//                   );
//                   streamController.postPolling(context, postModel,
//                       doInPost: () {
//                     Navigator.of(context).pop();
//                   });
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.only(
//                     left: 16,
//                     right: 18,
//                     top: 5,
//                     bottom: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(7),
//                     color: greenColor,
//                   ),
//                   child: Text(
//                     'Posting',
//                     style: whiteTextStyle.copyWith(fontSize: 13),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 32,
//                     height: 32,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/profiledummy.png'),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name,
//                         style: blackTextStyle.copyWith(fontSize: 14),
//                       ),
//                       const SizedBox(
//                         height: 2,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           customeModal(
//                             context,
//                             Wrap(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 25, horizontal: 20),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Siapa Yang Bisa Melihat Postingan Ini?',
//                                         style: blackTextStyle.copyWith(
//                                             fontSize: 16),
//                                       ),
//                                       SizedBox(
//                                         height: 30,
//                                       ),
//                                       FilterPublis(),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ).then((value) async {
//                             setState(() {
//                               visibility = value;
//                             });
//                           });
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 6, vertical: 4.42),
//                           decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: borderColor, width: 1.5),
//                               borderRadius: BorderRadius.circular(17)),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 'assets/icons/network-icons.png',
//                                 width: 7.151,
//                                 height: 7.151,
//                               ),
//                               const SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 visibility['title'].toString(),
//                                 style: subTitleTextStyle.copyWith(fontSize: 10),
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 17,
//               ),
//               TextFormField(
//                 maxLines: 5,
//                 controller: postDescController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: Colors.transparent,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   hintText: 'Apa Yang kamu Post..',
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   labelStyle: TextStyle(
//                     color: fromCssColor('#A3A3A3'),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.all(11),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(7),
//                   border: Border.all(color: borderColor),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ...optionController
//                         .asMap()
//                         .map(
//                           (i, element) => MapEntry(
//                             i,
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: TextFormPollPosition(
//                                     title: 'Pilihan ${i + 1}',
//                                     controller: optionController[i],
//                                     isLastElement:
//                                         i == optionController.length - 1,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 8,
//                                 ),
//                                 i == optionController.length - 1
//                                     ? GestureDetector(
//                                         onTap: () {
//                                           optionController
//                                               .add(TextEditingController());
//                                           setState(() {});
//                                         },
//                                         child: Container(
//                                           width: 24,
//                                           height: 24,
//                                           margin: EdgeInsets.only(bottom: 14),
//                                           decoration: BoxDecoration(
//                                               color: greenColor,
//                                               shape: BoxShape.circle),
//                                           child: Icon(
//                                             Icons.add,
//                                             color: whiteColor,
//                                             size: 20,
//                                           ),
//                                         ),
//                                       )
//                                     : SizedBox(
//                                         width: 24,
//                                         height: 24,
//                                       ),
//                               ],
//                             ),
//                           ),
//                         )
//                         .values
//                         .toList(),
//                     Row(
//                       children: [
//                         Text(
//                           'Berakhir',
//                           style: subTitleTextStyle.copyWith(
//                             fontSize: 14,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 11,
//                         ),
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                             horizontal: 10.0,
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: borderColor,
//                             ),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.access_time),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               DropdownButtonHideUnderline(
//                                 child: DropdownButton<int>(
//                                   value: days,
//                                   onChanged: (int? value) {
//                                     setState(() {
//                                       days = value!;
//                                     });
//                                   },
//                                   items: [1, 2, 3, 4, 5, 6, 7]
//                                       .map<DropdownMenuItem<int>>((int value) {
//                                     return DropdownMenuItem<int>(
//                                       value: value,
//                                       child: Text("$value Hari"),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             optionController.removeLast();
//                             setState(() {});
//                           },
//                           child: Text(
//                             'Hapus',
//                             style: subTitleTextStyle.copyWith(
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 28,
//               ),
//               TextFormField(
//                 maxLines: 2,
//                 controller: hashTagController,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: borderColor,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: borderColor,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   hintText: 'Tambahkan Hashtag concern. Contoh: #Jerawat 222',
//                   hintStyle: subTitleTextStyle.copyWith(
//                     fontStyle: FontStyle.italic,
//                     fontSize: 13,
//                   ),
//                   contentPadding:
//                       const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   labelStyle: TextStyle(
//                     color: fromCssColor('#A3A3A3'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
