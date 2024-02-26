import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// import '../controller/doctor/chat/chat_controller.dart';
import '../controller/customer/chat/chat_controller.dart';
import '../controller/doctor/consultation/consultation_controller.dart';
import '../core/global.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage({
    Key? key,
    this.path,
    required this.idRoom,
    required this.chatRoomId,
    required this.userId,
    required this.receiverId,
    required this.roomCode,
    required this.senderBy,
    required this.receiverBy,
    required this.sendMsg,
  }) : super(key: key);
  final List<XFile>? path;
  final int idRoom;
  final int chatRoomId;
  final int userId;
  final int receiverId;
  final String roomCode;
  final String senderBy;
  final String receiverBy;
  final void Function()? sendMsg;

  @override
  Widget build(BuildContext context) {
    final DoctorConsultationController state =
        Get.put(DoctorConsultationController());

    // var listImage = Get.arguments();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: 27,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: path!.length,
                itemBuilder: ((context, index) {
                  return Image.file(
                    File(path![index].path.toString()),
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  controller: state.messageController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: sendMsg,
                        // () {
                        // print('tes' + state.fileImage.toString());
                        // state.sendMessage(
                        //   idRoom,
                        //   chatRoomId,
                        //   userId,
                        //   receiverId,
                        //   roomCode,
                        //   state.messageController.text,
                        //   senderBy,
                        //   receiverBy,
                        // );
                        // state.selectedMultipleImage = [];
                        // Get.back();
                        // },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewImageDoctor extends StatelessWidget {
  const PreviewImageDoctor({
    Key? key,
    this.path,
    required this.idRoom,
    required this.chatRoomId,
    required this.userId,
    required this.receiverId,
    required this.roomCode,
    required this.senderBy,
    required this.receiverBy,
    required this.sendMsg,
  }) : super(key: key);
  final List? path;
  final int idRoom;
  final int chatRoomId;
  final int userId;
  final int receiverId;
  final String roomCode;
  final String senderBy;
  final String receiverBy;
  final void Function()? sendMsg;

  @override
  Widget build(BuildContext context) {
    final DoctorConsultationController state =
        Get.put(DoctorConsultationController());

    // var listImage = Get.arguments();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: 27,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: path!.length,
                itemBuilder: ((context, index) {
                  return Image.file(
                    File(path![index].path.toString()),
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  controller: state.messageController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: sendMsg,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewImage extends StatelessWidget {
  const PreviewImage({
    Key? key,
    this.path,
    required this.senderId,
  }) : super(key: key);
  final List? path;
  final String senderId;

  @override
  Widget build(BuildContext context) {
    // var listImage = Get.arguments();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          senderId,
          style: TextStyle(color: Colors.white),
        ),
        actions: [],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: path!.length,
                itemBuilder: ((context, index) {
                  return Image.network(
                      '${Global.FILE}/' + path![index].media.path);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraViewPageCustomer extends StatelessWidget {
  const CameraViewPageCustomer({
    Key? key,
    this.path,
    required this.idRoom,
    required this.chatRoomId,
    required this.userId,
    required this.receiverId,
    required this.roomCode,
    required this.senderBy,
    required this.receiverBy,
    required this.sendMsg,
  }) : super(key: key);
  final List<XFile>? path;
  final int idRoom;
  final int chatRoomId;
  final int userId;
  final int receiverId;
  final String roomCode;
  final String senderBy;
  final String receiverBy;
  final void Function()? sendMsg;

  @override
  Widget build(BuildContext context) {
    final CustomerChatController state = Get.put(CustomerChatController());

    // var listImage = Get.arguments();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: 27,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: path!.length,
                itemBuilder: ((context, index) {
                  return Image.file(
                    File(path![index].path.toString()),
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  controller: state.messageController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: sendMsg,
                        // () {
                        // print('tes' + state.fileImage.toString());
                        // state.sendMessage(
                        //   idRoom,
                        //   chatRoomId,
                        //   userId,
                        //   receiverId,
                        //   roomCode,
                        //   state.messageController.text,
                        //   senderBy,
                        //   receiverBy,
                        // );
                        // state.selectedMultipleImage = [];
                        // Get.back();
                        // },
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewImageCustomer extends StatelessWidget {
  const PreviewImageCustomer({
    Key? key,
    this.path,
    required this.idRoom,
    required this.chatRoomId,
    required this.userId,
    required this.receiverId,
    required this.roomCode,
    required this.senderBy,
    required this.receiverBy,
    required this.sendMsg,
  }) : super(key: key);
  final List? path;
  final int idRoom;
  final int chatRoomId;
  final int userId;
  final int receiverId;
  final String roomCode;
  final String senderBy;
  final String receiverBy;
  final void Function()? sendMsg;

  @override
  Widget build(BuildContext context) {
    final CustomerChatController state = Get.put(CustomerChatController());

    // var listImage = Get.arguments();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(
                Icons.crop_rotate,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.title,
                size: 27,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.edit,
                size: 27,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: path!.length,
                itemBuilder: ((context, index) {
                  return Image.file(
                    File(path![index].path.toString()),
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  controller: state.messageController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add Caption....",
                      prefixIcon: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white,
                        size: 27,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: sendMsg,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.tealAccent[700],
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
