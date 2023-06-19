import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';
import 'package:heystetik_mobileapps/widget/filter_tap_widget.dart';

class FilterTreatmen extends StatelessWidget {
  const FilterTreatmen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(left: 9, right: 9),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(25),
                          topStart: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => SingleChildScrollView(
                        child: Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 60, left: 21, right: 21),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Filter',
                                    style: blackHigtTextStyle.copyWith(
                                        fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 31,
                                  ),
                                  const FilterTap(
                                    title: 'Rating',
                                    img: 'assets/icons/stars-icons.png',
                                  ),
                                  const FilterTap(
                                    title: 'Popularitas',
                                    img: 'assets/icons/popularity.png',
                                  ),
                                  const FilterTap(
                                    title: 'Jarak',
                                    img: 'assets/icons/mapgrey.png',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/icons/filter-icon.png',
                    width: 13,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: const Text('Bintang 4.5+'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Treatment'),
                    SizedBox(
                      width: 9,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('Rentang harga'),
                    SizedBox(
                      width: 9,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 15,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: const Text('Promo'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 9),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 6, bottom: 6),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: borderColor),
                ),
                child: const Text('Bukas Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
