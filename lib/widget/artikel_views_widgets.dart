import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/pages/stream_page/view_detail_category.dart';
import 'package:heystetik_mobileapps/widget/appbar_widget.dart';

import '../theme/theme.dart';

class ArtikelNews extends StatelessWidget {
  final String img;
  final String category;
  final String judul;
  final String penerbit;
  final VoidCallback? onPressed;
  final String menit;
  const ArtikelNews({
    super.key,
    required this.img,
    required this.category,
    required this.judul,
    required this.penerbit,
    required this.menit,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 83,
                width: 123,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        switch (category) {
                          case 'Treatment':
                            Get.to(
                              ViewDetailCategoryNews(
                                categoryId: '1',
                                category: 'Treatment',
                              ),
                            );
                            break;
                          case 'Skincare':
                            Get.to(
                              ViewDetailCategoryNews(
                                categoryId: '2',
                                category: 'Skincare',
                              ),
                            );
                            break;
                          default:
                            Get.to(
                              ViewDetailCategoryNews(
                                categoryId: '3',
                                category: 'Concern',
                              ),
                            );
                        }
                      },
                      child: Text(
                        'Beauty / $category',
                        style: grenTextStyle.copyWith(fontSize: 9),
                      ),
                    ),
                    Text(
                      judul,
                      style: blackTextStyle.copyWith(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      penerbit,
                      style: subTitleTextStyle.copyWith(fontSize: 9),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/icons/book-menu.png',
                          width: 9.5,
                          height: 9.5,
                        ),
                        Text(
                          ' $menit Mins',
                          style: subTitleTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          dividergrey(),
        ],
      ),
    );
  }
}
