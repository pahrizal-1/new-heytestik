import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: greenColor,
              ),
            ),
          )
        : child;
  }
}
// child: SpinKitCircle(
                //   itemBuilder: (context, index) {
                //     final colors = [greenColor, Colors.black54];
                //     final color = colors[index % colors.length];
                //     return DecoratedBox(
                //       decoration:
                //           BoxDecoration(color: color, shape: BoxShape.circle),
                //     );
                //   },
                // ),