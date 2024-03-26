// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:heystetik_mobileapps/widget/snackbar_widget.dart';
import 'package:permission_handler/permission_handler.dart';

bool dirExists = false;
dynamic externalDir = '/storage/emulated/0/Download/Qr_code';
Future<void> captureAndSavePng(BuildContext context, GlobalKey qrkey) async {
  try {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    RenderRepaintBoundary boundary =
        qrkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    var image = await boundary.toImage(pixelRatio: 3.0);

    //Drawing White Background because Qr Code is Black
    final whitePaint = Paint()..color = Colors.white;
    final recorder = PictureRecorder();
    final canvas = Canvas(recorder,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()));
    canvas.drawRect(
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
        whitePaint);
    canvas.drawImage(image, Offset.zero, Paint());
    final picture = recorder.endRecording();
    final img = await picture.toImage(image.width, image.height);
    ByteData? byteData = await img.toByteData(format: ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    //Check for duplicate file name to avoid Override
    String fileName = 'qr_code';
    int i = 1;
    while (await File('$externalDir/$fileName.png').exists()) {
      fileName = 'qr_code_heystetik_$i';
      i++;
    }

    // Check if Directory Path exists or not
    dirExists = await File(externalDir).exists();
    //if not then create the path
    if (!dirExists) {
      await Directory(externalDir).create(recursive: true);
      dirExists = true;
    }

    final file = await File('$externalDir/$fileName.png').create();
    await file.writeAsBytes(pngBytes);

    // if (!mounted) return;
    SnackbarWidget.getSuccessSnackbar(
        context, 'Info', 'QR code saved to gallery');
  } catch (e) {
    print("ERROR $e");
    // if (!mounted) return;
    SnackbarWidget.getErrorSnackbar(context, 'Info', 'Something went wrong!!!');
  }
}
