import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/chat/chat_controller.dart';
import 'package:heystetik_mobileapps/core/global.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/loading_widget.dart';

class GambarPage extends StatefulWidget {
  final int? id;
  const GambarPage({required this.id, super.key});

  @override
  State<GambarPage> createState() => _GambarPageState();
}

class _GambarPageState extends State<GambarPage> {
  final CustomerChatController state = Get.put(CustomerChatController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      state.galleryFile(context, widget.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingWidget(
          isLoading: state.isLoading.value,
          child: state.gallery.isEmpty
              ? Center(
                  child: Text(
                    'Belum ada gambar',
                    style: TextStyle(
                      fontWeight: bold,
                      fontFamily: 'ProximaNova',
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.gallery.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(
                              '${Global.FILE}/${state.gallery[index].media?.path}', // Ganti dengan path dan nama file foto Anda
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
