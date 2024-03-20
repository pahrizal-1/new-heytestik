import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/core/global.dart';

class ShowImageFullScreenUlasan extends StatefulWidget {
  final List listImagesModel;
  final int current;
  const ShowImageFullScreenUlasan(
      {super.key, required this.listImagesModel, required this.current});

  @override
  State<ShowImageFullScreenUlasan> createState() =>
      _ShowImageFullScreenUlasanState();
}

class _ShowImageFullScreenUlasanState extends State<ShowImageFullScreenUlasan> {
  int current = 0;
  bool stateChange = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<T> map<T>(List listImage, Function handler) {
    List<T> result = [];

    for (var i = 0; i < listImage.length; i++) {
      result.add(handler(i, listImage[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    current = (stateChange == false) ? widget.current : current;
    return Container(
        color: Colors.transparent,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              //title: const Text('Transaction Detail'),
            ),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                        autoPlay: false,
                        height: MediaQuery.of(context).size.height / 1.3,
                        viewportFraction: 1.0,
                        onPageChanged: (index, data) {
                          setState(() {
                            stateChange = true;
                            current = index;
                          });
                        },
                        initialPage: widget.current),
                    items: map<Widget>(widget.listImagesModel, (index, url) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                child: Image.network(
                                  '${Global.FILE}/' +
                                      widget.listImagesModel[index].media.path,
                                  fit: BoxFit.fill,
                                  height: 400.0,
                                ),
                              ),
                            )
                          ]);
                    }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(widget.listImagesModel, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 9.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (current == index)
                              ? Colors.redAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            )));
  }
}
