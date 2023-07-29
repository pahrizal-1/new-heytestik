import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/local_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class InitSocket {
  IO.Socket? _socket;

  // INIATE CONNECT TO SOCKET
  connectSocket(BuildContext context) async {
    try {
      _socket = IO.io(
        'wss://heystetik.ahrulsyamil.com/socket',
        // 'ws://101.255.117.74:8192/chat',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .setExtraHeaders(
              {
                'Authorization': 'Bearer ${await LocalStorage().getAccessToken()}',
              },
            )
            .build(),
      );

      _socket?.onConnect((data) async {
        print('Connection established');
        // await onlineClients();
        // await newMessage();
        // await typingIndicator();
        await infoLog();
        // await recentChat();
      });
      _socket?.onConnectError((data) async {
        print('Connect Error: $data');
      });
      _socket?.onDisconnect((data) async {
        print('Socket.IO server disconnected');
      });
    } catch (e) {
      print('error nih $e');
    }
  }

  infoLog() {
    print("logInfo");
    _socket?.on('logInfo', (logInfo) {
      print('logInfo $logInfo');
      print('logInfo ${logInfo['success']}');
      // if (logInfo['success'] == false) {
      //   Navigator.pop(context);
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(logInfo['message']),
      //       backgroundColor: Colors.red,
      //     ),
      //   );
      // }
    });
    print("logInfo");
  }
}
