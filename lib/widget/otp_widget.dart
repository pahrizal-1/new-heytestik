import 'package:flutter/services.dart';
import 'package:heystetik_mobileapps/theme/theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/auth/register_controller.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<RegisterController>(context);

    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                      state.code = value;
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    fillColor: greenColor,
                    hoverColor: greenColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: subgreyColor),
                      borderRadius: BorderRadius.circular(10),
                    ), //< ,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greenColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    state.code = "${state.code}$value";
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: subgreyColor), borderRadius: BorderRadius.circular(10)),
                  fillColor: greenColor,
                  hoverColor: greenColor,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greenColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    state.code = "${state.code}$value";
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: subgreyColor), borderRadius: BorderRadius.circular(10)),
                  fillColor: greenColor,
                  hoverColor: greenColor,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greenColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    state.code = "${state.code}$value";
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: subgreyColor), borderRadius: BorderRadius.circular(10)),
                  fillColor: greenColor,
                  hoverColor: greenColor,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greenColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              width: 50,
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                    state.code = "${state.code}$value";
                  }
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [LengthLimitingTextInputFormatter(1), FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: subgreyColor), borderRadius: BorderRadius.circular(10)),
                  fillColor: greenColor,
                  hoverColor: greenColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: greenColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
