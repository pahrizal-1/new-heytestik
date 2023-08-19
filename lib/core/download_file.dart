import 'dart:io';
import 'dart:math';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:http/http.dart' as http;

Future downloadFileFromUrl(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    // Get the image name
    final imageName = path.basename(url);
    // Get the document directory path
    final appDir = await path_provider.getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = path.join(appDir.path, imageName);

    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);

    return localPath;
  } catch (e) {
    print("error download file $e");
  }
}

downloadFile(List<int> image) async {
  try {
    // Get temporary directory
    final dir = await path_provider.getTemporaryDirectory();

    // Create an image name
    var filename = '${dir.path}/image-${getRandomString(5)}.png';

    // Save to filesystem
    final file = File(filename);
    await file.writeAsBytes(image);

    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: file.path);
    final finalPath = await FlutterFileDialog.saveFile(params: params);

    if (finalPath != null) {
      print('Image saved to disk');
    } else {
      print("tidak tersimpan");
    }
  } catch (e) {
    print("error download file $e");
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
