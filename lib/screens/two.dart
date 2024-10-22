import 'package:app_test/controllers/color.dart';
import 'package:app_test/custom_widgets/appbar/app_bar.dart';
import 'package:app_test/custom_widgets/button/custom_elevated_button.dart';
import 'package:app_test/routes/constants.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// StatelessWidget 用于表示无状态的组件，它在整个生命周期中是不可变的，即组件的状态不会随时间或用户交互发生变化。
class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbar(title: "Two"),
        backgroundColor: Colors.white,
        body: GetBuilder<ColorController>(builder: (logic) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomElevatedButton(
                  buttonText: "change color".tr,
                  onPressed: () {
                    logic.setColor(0xff0563B6);
                    Get.back();
                  }),
            ),
          );
        }));
  }
}
