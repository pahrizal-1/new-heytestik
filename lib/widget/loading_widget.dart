import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    this.title = '',
    required this.isLoading,
    required this.child,
    this.top = 0,
  });
  final String title;
  final bool isLoading;
  final Widget child;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: isLoading ? top : 0),
        child: isLoading
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: greenColor,
                ),
              ),
              title == ''
                  ? Container()
                  : const SizedBox(
                height: spaceHeigt,
              ),
              title == ''
                  ? Container()
                  : Text(
                title,
                style: subGreyTextStyle,
              ),
            ],
          ),
        )
            : child,
      ),
    );
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