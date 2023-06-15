import 'package:flutter/material.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

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
                child: Image.asset(
                  'assets/icons/filter-icon.png',
                  width: 13,
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
