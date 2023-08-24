import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ua_client_hints/ua_client_hints.dart';

// don't forget this line
import 'package:webview_flutter/webview_flutter.dart';

import '../../controller/auth/login_controller.dart';
import '../../core/global.dart';

class LoginFacebookPage extends StatefulWidget {
  const LoginFacebookPage({Key? key}) : super(key: key);

  @override
  State<LoginFacebookPage> createState() => _LoginFacebookPageState();
}

class _LoginFacebookPageState extends State<LoginFacebookPage> {
  final LoginController state = Get.put(LoginController());
  // Create a webview controller
  WebViewController controller = WebViewController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onProgress: (int progress) {
              // print the loading progress to the console
              // you can use this value to show a progress bar if you want
              debugPrint("Loading: $progress%");
            },
            onPageStarted: (String url) async {
              print("INI PAGE STARTED");
              print(url);
              if (url.contains("heystetik://login?")) {
                String token = url.split("heystetik://login?token=")[1];
                print("INI TOKEN");
                print(token);
                print("UDAH MASUK SINI");
                await state.logInWithGoogle(context, token, doInPost: () async {
                  await state.redirectTo();
                });
              }
            },
            onUrlChange: (UrlChange url) async {
              print("INI URL CHANGE");
              print(url.url);

              if (url.url != null) {
                if (url.url!.contains("heystetik://login?")) {
                  String token = url.url!.split("heystetik://login?token=")[1];
                  print("INI TOKEN");
                  print(token);
                  context.loaderOverlay.show();
                  print("UDAH MASUK SINI");
                  await state.logInWithGoogle(context, token, doInPost: () async {
                    await state.redirectTo();
                  });
                }
              }
            },
            onPageFinished: (String url) {
              print(url);
            },
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              return NavigationDecision.navigate;
            },
          ),
        )
        ..setUserAgent(
          Platform.isIOS ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15' + ' (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1' : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) ' + 'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
        )
        ..loadRequest(
          Uri.parse("${Global.BASE_API}/auth/facebook/login"),
        );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          // the most important part of this example
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
