import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'filter_tap_widget.dart';

class TreatmentFilter extends StatelessWidget {
  const TreatmentFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Treatment',
                style: blackHigtTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const FilterTapTreatment(
                title: 'Cryolipolysis',
              ),
              const FilterTapTreatment(
                title: 'Electrocauter',
              ),
              const FilterTapTreatment(
                title: 'Facial',
              ),
              const FilterTapTreatment(
                title: 'Filler',
              ),
              const FilterTapTreatment(
                title: 'Hifu',
              ),
              const FilterTapTreatment(
                title: 'Laser Co2',
              ),
              const FilterTapTreatment(
                title: 'Laser Erbium',
              ),
              const FilterTapTreatment(
                title: 'Laser Nd:Yag ',
              ),
              const FilterTapTreatment(
                title: 'Laser Pico Lase',
              ),
              const FilterTapTreatment(
                title: 'Laser Pico Laser',
              ),
              const FilterTapTreatment(
                title: 'Pulsed Dye',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
              const FilterTapTreatment(
                title: 'Led Light Therapy',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 22, top: 10, bottom: 10, right: 22),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Batal',
                          style: grenTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                          color: greenColor,
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(7)),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                              fontSize: 15, fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
