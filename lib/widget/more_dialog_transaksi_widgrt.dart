import "dart:async";

import "package:flutter/material.dart";

import "../pages/auth/auth_page.dart";
import "../theme/theme.dart";

class TransaksiMoreDialog extends StatefulWidget {
  const TransaksiMoreDialog({super.key});

  @override
  State<TransaksiMoreDialog> createState() => _TransaksiMoreDialogState();
}

class _TransaksiMoreDialogState extends State<TransaksiMoreDialog> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 1),
  //     () => Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (BuildContext context) => const AuthPage(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: 1000,
          child: AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            alignment: Alignment.bottomCenter,
            content: Text("pheizal"),
          )),
    );
  }
}
