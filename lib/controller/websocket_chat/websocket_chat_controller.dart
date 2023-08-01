import '../../core/state_class.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';

class WebSocketChatController extends StateClass {

  IO.Socket? _socket;
  RxBool isOnline = false.obs;



  // EVENT ONLINE CLIENT (udah dipanggil)
  // onlineClients() {
  //   print("onlineClients");
  //   _socket?.on('onlineClients', (onlineClients) async {
  //     print("onlineClients $onlineClients");
  //     if (onlineClients.length != null) {
  //       for (int i = 0; i < onlineClients.length; i++) {
  //         if (onlineClients[i]['user_fullname'] == widget.penerima) {
  //           if (mounted) {
  //             setState(() {
  //               isOnline.value = true;
  //             });
  //           }
  //         } else {
  //           if (mounted) {
  //             setState(() {
  //               isOnline.value = false;
  //             });
  //           }
  //         }
  //       }
  //     }
  //   });
  //   print("onlineClients");
  // }

}