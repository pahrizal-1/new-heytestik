// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:heystetik_mobileapps/core/global.dart';
// import 'package:heystetik_mobileapps/models/stream_home.dart';
// import 'package:heystetik_mobileapps/widget/share_solusion_widget_page.dart';
// import 'package:heystetik_mobileapps/widget/text_with_mentions.dart';
// import 'package:intl/intl.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../widget/shere_link_stream.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../controller/customer/stream/post_controller.dart';
// import '../pages/stream_page/komentar_stream_page.dart';
// import '../theme/theme.dart';

// class StreamPostGeneral extends StatefulWidget {
//   const StreamPostGeneral({
//     super.key,
//     required this.stream,
//   });

//   final StreamHomeModel stream;

//   @override
//   State<StreamPostGeneral> createState() => _StreamPostGeneralState();
// }

// class _StreamPostGeneralState extends State<StreamPostGeneral> {
//   final StreamController StreamController = Get.put(StreamController());
//   bool? like;
//   bool? saved;
//   Map<String, int> postLike = {};
//   int activeIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 20,
//         right: 17,
//         top: 16,
//         bottom: 18,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   image: DecorationImage(
//                     image: widget.stream.photoUser == "" ||
//                             widget.stream.photoUser == "photo_profile"
//                         ? AssetImage(
//                             'assets/images/profiledummy.png',
//                           )
//                         : NetworkImage(
//                                 '${Global.FILE}/${widget.stream.photoUser}')
//                             as ImageProvider,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 width: 11,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.stream.fullname,
//                     style: blackTextStyle.copyWith(fontSize: 14),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Text(
//                     '${DateFormat('dd MMMM yyyy').format(DateTime.parse(widget.stream.createdAt))}, ${timeago.format(DateTime.parse(widget.stream.createdAt))}',
//                     style: subTitleTextStyle.copyWith(fontSize: 10),
//                   )
//                 ],
//               ),
//               const Spacer(),
//               InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                     context: context,
//                     backgroundColor: Colors.white,
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadiusDirectional.only(
//                         topEnd: Radius.circular(25),
//                         topStart: Radius.circular(25),
//                       ),
//                     ),
//                     builder: (context) => ShareLinkStream(
//                       username: widget.stream.username,
//                     ),
//                   );
//                 },
//                 child: Icon(
//                   Icons.more_horiz,
//                   color: subgreyColor,
//                   size: 24,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           buildRichTextWithMentions(
//             widget.stream.content,
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           CarouselSlider(
//             options: CarouselOptions(
//               padEnds: false,
//               enableInfiniteScroll: true,
//               height: 300,
//               onPageChanged: (index, reason) =>
//                   setState(() => activeIndex = index),
//               viewportFraction: 1,
//             ),
//             items: widget.stream.postImage.map((image) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return InkWell(
//                     onTap: () {
//                       // Get.to(
//                       //     GalleryWidgets(urlImages: widget.stream.postImage));
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                             "${Global.FILE}/$image",
//                           ),
//                         ),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: AnimatedSmoothIndicator(
//               activeIndex: activeIndex,
//               count: widget.stream.postImage.length,
//               effect: ScaleEffect(
//                   activeDotColor: greenColor,
//                   dotColor: const Color(0xffD9D9D9),
//                   dotWidth: 6,
//                   dotHeight: 6),
//             ),
//           ),
//           if (widget.stream.hashtags.isNotEmpty) ...[
//             const SizedBox(
//               height: 16,
//             ),
//             Wrap(
//               children: widget.stream.hashtags.map((hashtag) {
//                 return Text(
//                   "#$hashtag",
//                   style: grenTextStyle.copyWith(
//                     fontSize: 14,
//                     fontWeight: regular,
//                   ),
//                 );
//               }).toList(),
//             ),
//           ],
//           const SizedBox(
//             height: 16,
//           ),
//           Text(
//             "${widget.stream.streamLikes + (postLike["${widget.stream.id}"] ?? 0)} Menyukai",
//             style: subTitleTextStyle.copyWith(fontSize: 12),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         if (like ?? widget.stream.liked) {
//                           StreamController.unlikePost(context, widget.stream.id);
//                           setState(() {
//                             like = false;
//                             postLike["${widget.stream.id}"] =
//                                 (postLike["${widget.stream.id}"] ?? 0) - 1;
//                           });
//                         } else {
//                           StreamController.likePost(context, widget.stream.id);
//                           setState(() {
//                             like = true;
//                             postLike["${widget.stream.id}"] =
//                                 (postLike["${widget.stream.id}"] ?? 0) + 1;
//                           });
//                         }
//                       },
//                       child: like ?? widget.stream.liked
//                           ? Image.asset(
//                               'assets/icons/like.png',
//                               width: 19,
//                               height: 19,
//                               color: greenColor,
//                             )
//                           : Image.asset(
//                               'assets/icons/like.png',
//                               width: 19,
//                               height: 19,
//                               color: greyColor,
//                             )),
//                   const SizedBox(
//                     width: 15,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       showModalBottomSheet(
//                         isDismissible: false,
//                         context: context,
//                         backgroundColor: Colors.white,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadiusDirectional.only(
//                             topEnd: Radius.circular(25),
//                             topStart: Radius.circular(25),
//                           ),
//                         ),
//                         builder: (context) => ShareShowWidget(),
//                       );
//                     },
//                     child: SvgPicture.asset(
//                       'assets/icons/share-icons.svg',
//                       // ignore: deprecated_member_use
//                       color: greyColor,
//                       width: 21,
//                       height: 21,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 18,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       if (saved ?? widget.stream.saved) {
//                         StreamController.unSavePost(context, widget.stream.id);
//                         setState(() {
//                           saved = false;
//                         });
//                       } else {
//                         StreamController.savePost(context, widget.stream.id);
//                         setState(() {
//                           saved = true;
//                         });
//                       }
//                     },
//                     child: saved ?? widget.stream.saved
//                         ? Icon(
//                             Icons.bookmark,
//                             color: greenColor,
//                           )
//                         : Icon(
//                             Icons.bookmark_border,
//                             color: greyColor,
//                           ),
//                   ),
//                 ],
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           KomentarStreamPage(post: widget.stream),
//                     ),
//                   );
//                 },
//                 child: Row(
//                   children: [
//                     Text(
//                       widget.stream.streamComments.toString(),
//                       style: TextStyle(
//                         color: greyColor,
//                         fontSize: 14,
//                         fontWeight: bold,
//                         fontFamily: 'ProximaNova',
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     Container(
//                       height: 20,
//                       width: 20,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/icons/komen1.png'),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class GalleryWidgets extends StatefulWidget {
// //   final PageController pageController;
// //   final List urlImages;
// //   final int index;
// //   GalleryWidgets({super.key, required this.urlImages, this.index = 0})
// //       : pageController = PageController(initialPage: index);

// //   @override
// //   State<GalleryWidgets> createState() => _GalleryWidgetsState();
// // }

// // class _GalleryWidgetsState extends State<GalleryWidgets> {
// //   late int index = widget.index;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Stack(
// //       alignment: Alignment.bottomLeft,
// //       children: [
// //         PhotoViewGallery.builder(
// //           pageController: widget.pageController,
// //           itemCount: widget.urlImages.length,
// //           builder: (context, index) {
// //             final urlImage = widget.urlImages[index];
// //             return PhotoViewGalleryPageOptions(
// //               imageProvider: NetworkImage(urlImage),
// //               minScale: PhotoViewComputedScale.contained,
// //               maxScale: PhotoViewComputedScale.contained * 4,
// //             );
// //           },
// //           onPageChanged: (index) => setState(() => this.index = index),
// //         ),
// //         Container(
// //           padding: EdgeInsets.all(16),
// //           child: Text(
// //             'image ${index + 1}/${widget.urlImages.length}',
// //             style: whiteTextStyle.copyWith(fontSize: 13),
// //           ),
// //         )
// //       ],
// //     ));
// //   }
// // }
