import 'dart:io';
import 'dart:ui';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('@drawable/launcher_icon');
    void onDidReceiveLocalNotification(
        int id, String? title, String? body, String? payload) {
      print('id $id');
    }

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    var initializationsSettings = InitializationSettings(
      android: androidInitialize,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationsSettings);
  }

  // Future<String> _downloadAndSaveFile(String url, String fileName) async {
  //   final Directory directory = await getApplicationDocumentsDirectory();
  //   final String filePath = '${directory.path}/$fileName';
  //   final http.Response response = await http.get(Uri.parse(url));
  //   final File file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

  Future<void> notifChat(
    int id,
    String title,
    String body,
    int durasi,
    // String largeIconUrl,
    // String bigPictureUrl,
  ) async {
    // String largeIconPath =
    //     await _downloadAndSaveFile(largeIconUrl, 'largeIcon$id');
    // String bigPicturePath =
    //     await _downloadAndSaveFile(bigPictureUrl, 'bigPicture$id');
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(
        Duration(milliseconds: durasi),
      ), //schedule the notification to show after 2 seconds.
      const NotificationDetails(
        // Android details
        android: AndroidNotificationDetails(
          'notifChat',
          'Notif Chat',
          // groupKey: 'com.example.flutter_push_notifications',
          channelDescription: 'Notif Chat',
          importance: Importance.max,
          priority: Priority.high,
          autoCancel: false,
          enableVibration: false,
          audioAttributesUsage: AudioAttributesUsage.alarm,
          // vibrationPattern: vibrationPattern,
          icon: '@drawable/launcher_icon',
          playSound: true,
          // ticker: 'ticker',
          // timeoutAfter: 100,
          // additionalFlags: Int32List.fromList(<int>[insistentFlag]),
          // sound: const RawResourceAndroidNotificationSound('adzan'),
          largeIcon: DrawableResourceAndroidBitmap('@drawable/launcher_icon'),
          // INI UNTUK GAMBAR GEDE
          // styleInformation: BigPictureStyleInformation(
          //   FilePathAndroidBitmap(bigPicturePath),
          //   largeIcon: FilePathAndroidBitmap(largeIconPath),
          //   hideExpandedLargeIcon: false,
          //   contentTitle: title,
          //   htmlFormatContentTitle: true,
          //   summaryText: body,
          //   htmlFormatSummaryText: true,
          // ),
          color: Color.fromARGB(255, 7, 114, 177),
        ),
        // iOS details
        iOS: DarwinNotificationDetails(
          sound: 'default.wav',
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),

      // Type of time interpretation
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle:
          true, // To show notification even when the app is closed
    );
  }
}
