import 'package:app_test/controllers/color.dart';
import 'package:app_test/routes/constants.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/appbar/app_bar.dart';
import '../custom_widgets/button/custom_elevated_button.dart';

// StatelessWidget 用于表示无状态的组件，它在整个生命周期中是不可变的，即组件的状态不会随时间或用户交互发生变化。
class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double safeBottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: customAppbar(title: "One"),
        backgroundColor: Colors.white,
        body: GetBuilder<ColorController>(builder: (logic) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 300,
                  color: Color(logic.screenColor),
                  child: Text(
                    "${logic.screenColor}",
                  )),
              Expanded(
                  child: SafeArea(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomElevatedButton(
                          onPressed: () {
                            logic.setColor(0xFFB71C1C);
                          },
                          buttonText: "Change Red".tr,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteConstants.twoRoute);
                          },
                          buttonText: "Next To Two".tr,
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          );
        }));
  }
}
