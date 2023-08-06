import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'filter_tap_widget.dart';

class TreatmentFilter extends StatefulWidget {
  const TreatmentFilter({
    super.key,
  });

  @override
  State<TreatmentFilter> createState() => _TreatmentFilterState();
}

class _TreatmentFilterState extends State<TreatmentFilter> {
  List<String> filter = [];
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
                style: blackHigtTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Cryolipolysis',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Electrocauter',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Facial',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Filler',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Hifu',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Laser Co2',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Laser Erbium',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Laser Nd:Yag ',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Laser Pico Lase',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Laser Pico Laser',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Pulsed Dye',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
              FilterTapTreatment(
                onTap: (){

                },
                title: 'Led Light Therapy',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 22,
              top: 10,
              bottom: 10,
              right: 22,
            ),
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
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Batal',
                          style: grenTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: bold,
                          ),
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
                        borderRadius: BorderRadius.circular(7),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          'Simpan',
                          style: whiteTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: bold,
                          ),
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
