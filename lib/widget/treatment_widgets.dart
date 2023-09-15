import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heystetik_mobileapps/controller/customer/treatment/treatment_controller.dart';

import '../models/lookup_treatment.dart';
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
  final TreatmentController treatmentController =
      Get.put(TreatmentController());
  List<String> filter = [];
  List<LookupTreatmentModel> treatments = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      treatments.addAll(await treatmentController.getLookupTreatment(context));
      setState(() {});
    });
    super.initState();
  }

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
              ...treatments.map((treatment) {
                return FilterTapTreatment(
                  onTap: () {
                    filter.add(treatment.name);
                  },
                  title: treatment.name,
                );
              }).toList(),
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
                    onTap: () {
                      Navigator.pop(context, filter);
                    },
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
