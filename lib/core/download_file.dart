import 'dart:io';
import 'dart:math';
import 'package:open_file/open_file.dart';
import 'package:dio/dio.dart';
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

Future downloadInvoice(String name, String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    // Get the image name
    final imageName = path.basename(url);
    // Get the document directory path
    final appDir = await path_provider.getApplicationDocumentsDirectory();

    // This is the saved image path
    // You can use it to display the saved image later
    final localPath = path.join(appDir.path, "$imageName.pdf");

    // Downloading
    final imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);
    // Ask the user to save it
    final params = SaveFileDialogParams(sourceFilePath: imageFile.path);
    print("params $params");
    final finalPath = await FlutterFileDialog.saveFile(params: params);
    print("finalPath $finalPath");
    return localPath;
  } catch (e) {
    print("error download file $e");
  }
}

Future download(Dio dio, String url) async {
  try {
    // Get the image name
    final imageName = path.basename(url);
    print(" imageName $imageName");
    // Get the document directory path
    final appDir = await path_provider.getApplicationDocumentsDirectory();
    print(" appDir $appDir");
    final localPath = path.join(appDir.path, "$imageName.pdf");
    print(" localPath $localPath");
    // final imageFile = File(localPath);
    Response response = await dio.get(
      url,
      // onReceiveProgress: updateProgress,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    print(" response $response");
    var file = File(localPath).openSync(mode: FileMode.write);
    print(" file $file");
    file.writeFromSync(response.data);
    await file.close();

    // Here, you're catching an error and printing it. For production
    // apps, you should display the warning to the user and give them a
    // way to restart the download.
  } catch (e) {
    print("euy uye $e");
  }
}

Future<File?> downloadFile2(
    {required String url,
    String? name,
    Map<String, dynamic>? headers,
    Function(dynamic error)? onError}) async {
  try {
    name ??= url.split('/').last;
    print("name $name");
    var appStorage = await path_provider.getApplicationDocumentsDirectory();
    print("appStorage $appStorage");
    final file = File('${appStorage.path}/$name');
    print("file $file");
    final response = await Dio().get(
      url,
      options: Options(
        responseType: ResponseType.bytes,
        headers: headers,
        followRedirects: false,
        receiveTimeout: 0,
      ),
    );
    print("response $response");
    final raf = file.openSync(mode: FileMode.write);
    print("raf $raf");
    raf.writeFromSync(response.data);
    print("raf $raf");
    await raf.close();

    return file;
  } catch (e) {
    print("hehehahahahahah $e");
    if (onError != null) onError(e);
    return null;
  }
}

Future downloadAndOpenFile(
    {required String url,
    required String name,
    Map<String, dynamic>? headers,
    Function(dynamic error)? onError}) async {
  final file = await downloadFile2(
    url: url,
    name: name,
    headers: headers,
    onError: onError,
  );

  print("file www $file www");
  if (file == null) return;
  print("dsds");
  openFile(file.path);
  print("qqqq");
}

openFile(String filePath) {
  OpenFile.open(filePath);
}
