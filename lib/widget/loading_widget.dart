import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/shimmer_widget.dart';
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
      color: Colors.transparent,
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

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({
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
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: isLoading ? top : 0),
        child: isLoading
            ? ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  shimmerWidget(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: spaceHeigt,
                  ),
                  shimmerWidget(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: spaceHeigt,
                  ),
                  shimmerWidget(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(color: borderColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ],
              )
            : child,
      ),
    );
  }
}

class LoadingMore extends StatelessWidget {
  const LoadingMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(
          color: greenColor,
        ),
      ),
    );
  }
}
