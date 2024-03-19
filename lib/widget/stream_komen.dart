// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:heystetik_mobileapps/controller/customer/account/profile_controller.dart';
// import 'package:heystetik_mobileapps/controller/customer/stream/stream_controller.dart';
// import 'package:heystetik_mobileapps/core/global.dart';
// import 'package:heystetik_mobileapps/models/stream_comment.dart';
// import 'package:heystetik_mobileapps/pages/profile_costumer/profil_customer_page.dart';
// import 'package:heystetik_mobileapps/pages/stream_page/user_followed_stream_page.dart';
// import 'package:heystetik_mobileapps/theme/theme.dart';
// import 'package:timeago/timeago.dart' as timeago;
// import '../../widget/text_with_mentions.dart';

// class StreamKomenWidget extends StatefulWidget {
//   StreamCommentModel comment;
//   StreamKomenWidget({super.key, required this.comment});

//   @override
//   State<StreamKomenWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<StreamKomenWidget> {
//   final ProfileController stateProfile = Get.put(ProfileController());
//   final StreamController stateStream = Get.put(StreamController());
//   StreamCommentModel? comment;
//   bool? like;
//   Map<String, int> commentLikes = {};
//   @override
//   void initState() {
//     super.initState();
//     comment = widget.comment;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         InkWell(
//           onTap: () {
//             if (stateProfile.username.value == comment?.userName) {
//               Get.to(() => const ProfilCustomerPage());
//             } else {
//               Get.to(
//                 () => UserFollowedStreamPage(
//                   username: comment!.userName,
//                   fullname: comment!.fullName,
//                 ),
//               );
//             }
//           },
//           child: Container(
//             height: 30,
//             width: 30,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: comment?.photoUser == "" ||
//                         comment?.photoUser == "photo_profile"
//                     ? AssetImage(
//                         'assets/images/profiledummy.png',
//                       )
//                     : NetworkImage('${Global.FILE}/${comment?.photoUser}')
//                         as ImageProvider,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 11,
//         ),
//         Expanded(
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     if (stateProfile.username.value == comment?.userName) {
//                       Get.to(() => const ProfilCustomerPage());
//                     } else {
//                       Get.to(
//                         () => UserFollowedStreamPage(
//                           username: comment!.userName,
//                           fullname: comment!.fullName,
//                         ),
//                       );
//                     }
//                   },
//                   child: Row(
//                     children: [
//                       Text(
//                         comment?.fullName ?? "",
//                         style: blackTextStyle.copyWith(fontSize: 14),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         timeago
//                             .format(DateTime.parse(comment?.createdAt ?? "")),
//                         style: blackRegulerTextStyle.copyWith(
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 6,
//                 ),
//                 buildRichTextWithMentions(
//                   context,
//                   comment?.content ?? "",
//                   fullname: comment?.fullName ?? "",
//                 ),
//                 const SizedBox(
//                   height: 11,
//                 ),
//                 Row(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         if ((comment?.like ?? 0) +
//                                 (commentLikes["${comment?.commentID}"] ?? 0) >
//                             0) {
//                           print("TIDAK SUKA KOMEN");
//                           stateStream.unlikeComment(
//                             context,
//                             widget.postId,
//                             comment?.commentID,
//                           );
//                           setState(() {
//                             commentLikes.update(
//                                 "${comment?.commentID}",
//                                 (value) =>
//                                     (commentLikes["${comment?.commentID}"] ??
//                                         0) -
//                                     1);
//                           });
//                         } else {
//                           print("SUKA KOMEN");
//                           stateStream.likeComment(
//                             context,
//                             widget.postId,
//                             comment?.commentID,
//                           );
//                           setState(() {
//                             commentLikes.update(
//                                 "${comment?.commentID}",
//                                 (value) =>
//                                     (commentLikes["${comment?.commentID}"] ??
//                                         0) +
//                                     1);
//                           });
//                         }
//                       },
//                       child: comment?.like +
//                                   (commentLikes["${comment?.commentID}"] ?? 0) >
//                               0
//                           ? commentLike(comment?.like +
//                               (commentLikes["${comment?.commentID}"] ?? 0))
//                           : Text(
//                               'Suka',
//                               style: blackRegulerTextStyle.copyWith(
//                                 fontSize: 12,
//                               ),
//                             ),
//                     ),
//                     const SizedBox(
//                       width: 17,
//                     ),
//                     Text(
//                       'Balas',
//                       style: blackRegulerTextStyle.copyWith(
//                         fontSize: 12,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 8.0,
//                 ),
//                 if (viewCommentReply["${comment?.commentID}"] == true)
//                   InkWell(
//                     onTap: () async {
//                       viewCommentReply.update(
//                         "${comment?.commentID}",
//                         (value) => true,
//                       );
//                       List<StreamCommentReplyModel> replies =
//                           await stateStream.getCommentReplies(
//                         context,
//                         page,
//                         widget.postId,
//                         comment?.commentID,
//                       );

//                       commentReplies.addAll({
//                         "${comment?.commentID}": replies,
//                       });

//                       for (var i = 0; i < replies.length; i++) {
//                         commentReplyLikes.addAll({
//                           "${replies[i].replyID}": 0,
//                         });
//                       }
//                       setState(() {});
//                     },
//                     child: Text(
//                       "View Comments",
//                       style: greyTextStyle,
//                     ),
//                   ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 if (viewCommentReply["${comment?.commentID}"] == true)
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount:
//                         commentReplies["${comment?.commentID}"]?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(
//                           vertical: 5.0,
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 10,
//                         ),
//                         decoration: BoxDecoration(
//                           color: const Color.fromRGBO(241, 241, 241, 0.95),
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     if (stateProfile.username.value ==
//                                         commentReplies[
//                                                 "${comment?.commentID}"]![index]
//                                             .userName) {
//                                       Get.to(() => const ProfilCustomerPage());
//                                     } else {
//                                       Get.to(
//                                         () => UserFollowedStreamPage(
//                                           username: commentReplies[
//                                                       "${comment?.commentID}"]![
//                                                   index]
//                                               .userName,
//                                           fullname: commentReplies[
//                                                       "${comment?.commentID}"]![
//                                                   index]
//                                               .fullName,
//                                         ),
//                                       );
//                                     }
//                                   },
//                                   child: Container(
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       image: DecorationImage(
//                                         image: commentReplies["${comment?.commentID}"]![
//                                                             index]
//                                                         .photoUser ==
//                                                     "" ||
//                                                 commentReplies["${comment?.commentID}"]![
//                                                             index]
//                                                         .photoUser ==
//                                                     "photo_profile"
//                                             ? AssetImage(
//                                                 'assets/images/profiledummy.png',
//                                               )
//                                             : NetworkImage(
//                                                 '${Global.FILE}/${commentReplies["${comment?.commentID}"]![index].photoUser}',
//                                               ) as ImageProvider,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: 11,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         if (stateProfile.username.value ==
//                                             commentReplies[
//                                                         "${comment?.commentID}"]![
//                                                     index]
//                                                 .userName) {
//                                           Get.to(
//                                               () => const ProfilCustomerPage());
//                                         } else {
//                                           Get.to(
//                                             () => UserFollowedStreamPage(
//                                               username: commentReplies[
//                                                           "${comment?.commentID}"]![
//                                                       index]
//                                                   .userName,
//                                               fullname: commentReplies[
//                                                           "${comment?.commentID}"]![
//                                                       index]
//                                                   .fullName,
//                                             ),
//                                           );
//                                         }
//                                       },
//                                       child: Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             commentReplies[
//                                                         "${comment?.commentID}"]![
//                                                     index]
//                                                 .fullName,
//                                             style: blackTextStyle.copyWith(
//                                                 fontSize: 14),
//                                           ),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           Text(
//                                             timeago.format(DateTime.parse(
//                                                 commentReplies[
//                                                             "${comment?.commentID}"]![
//                                                         index]
//                                                     .createdAt)),
//                                             style: blackRegulerTextStyle
//                                                 .copyWith(fontSize: 12),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 6,
//                                     ),
//                                     Container(
//                                       constraints:
//                                           const BoxConstraints(maxWidth: 220),
//                                       child: buildRichTextWithMentions(
//                                         context,
//                                         commentReplies[
//                                                 "${comment?.commentID}"]![index]
//                                             .content,
//                                         fullname: commentReplies[
//                                                 "${comment?.commentID}"]![index]
//                                             .fullName,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 11,
//                                     ),
//                                     Row(
//                                       children: [
//                                         (commentReplyLikes["${commentReplies["${comment?.commentID}"]![index].replyID}"] ??
//                                                         0) +
//                                                     commentReplies[
//                                                                 "${comment?.commentID}"]![
//                                                             index]
//                                                         .like >
//                                                 0
//                                             ? InkWell(
//                                                 onTap: () {
//                                                   stateStream
//                                                       .unlikeCommentReply(
//                                                     context,
//                                                     widget.postId,
//                                                     comment?.commentID,
//                                                     commentReplies[
//                                                                 "${comment?.commentID}"]![
//                                                             index]
//                                                         .replyID,
//                                                   );
//                                                   setState(() {
//                                                     commentReplyLikes.update(
//                                                         "${commentReplies["${comment?.commentID}"]![index].replyID}",
//                                                         (value) =>
//                                                             (commentReplyLikes[
//                                                                     "${commentReplies["${comment?.commentID}"]![index].replyID}"] ??
//                                                                 0) -
//                                                             1);
//                                                   });
//                                                 },
//                                                 child: commentLike(commentReplies[
//                                                                 "${comment?.commentID}"]![
//                                                             index]
//                                                         .like +
//                                                     (commentReplyLikes[
//                                                             "${commentReplies["${comment?.commentID}"]![index].replyID}"] ??
//                                                         0)),
//                                               )
//                                             : InkWell(
//                                                 onTap: () {
//                                                   stateStream.likeCommentReply(
//                                                     context,
//                                                     widget.postId,
//                                                     comment?.commentID,
//                                                     commentReplies[
//                                                                 "${comment?.commentID}"]![
//                                                             index]
//                                                         .replyID,
//                                                   );
//                                                   setState(() {
//                                                     commentReplyLikes.update(
//                                                         "${commentReplies["${comment?.commentID}"]![index].replyID}",
//                                                         (value) =>
//                                                             (commentReplyLikes[
//                                                                     "${commentReplies["${comment?.commentID}"]![index].replyID}"] ??
//                                                                 0) +
//                                                             1);
//                                                   });
//                                                 },
//                                                 child: Text(
//                                                   'Suka',
//                                                   style: blackRegulerTextStyle
//                                                       .copyWith(
//                                                     fontSize: 10,
//                                                   ),
//                                                 ),
//                                               ),
//                                         const SizedBox(
//                                           width: 17,
//                                         ),
//                                         Text(
//                                           'Balas',
//                                           style: blackRegulerTextStyle.copyWith(
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//               ],
//             ),
//           ),
//         ),
//         InkWell(
//           onTap: () {
//             showModalBottomSheet(
//               context: context,
//               backgroundColor: Colors.white,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadiusDirectional.only(
//                   topEnd: Radius.circular(25),
//                   topStart: Radius.circular(25),
//                 ),
//               ),
//               builder: (context) => ShareLinkStream(
//                 post: post!,
//                 isMe: stateProfile.username.value == comment?.userName
//                     ? true
//                     : false,
//                 follow: (follow ?? (post?.follow ?? false)),
//               ),
//             );
//           },
//           child: Icon(
//             Icons.more_horiz,
//             color: subgreyColor,
//             size: 24,
//           ),
//         )
//       ],
//     );
//   }
// }
