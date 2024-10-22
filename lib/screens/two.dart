
import 'package:app_test/controllers/color.dart';
import 'package:app_test/routes/constants.dart';
import 'package:app_test/utils/common_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// StatelessWidget 用于表示无状态的组件，它在整个生命周期中是不可变的，即组件的状态不会随时间或用户交互发生变化。
class TwoScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    double safa_bottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Two",
            style: CommonStyle.text_18_black,
          ),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              ),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: GetBuilder<ColorController>(builder: (logic) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: 300,
                  height: 300,
                  color: Color(logic.screenColor),
                  child: Text(
                    "${logic.screenColor}",
                  )),

              Container(
                //height: 80,
                width: double.infinity,
                //color: Colors.red,
                padding: EdgeInsets.only(
                    top: 0, left: 20, right: 20, bottom: safa_bottom),
                child: Column(
                  children: [
                    GetBuilder<ColorController>(builder: (logic) {
                      return TextButton(
                        onPressed: () async {
                          logic.setColor(0xff0563B6);
                          Get.back();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Color(0xff0563B6))),
                        child: Text(
                          "change color".tr,
                          style: CommonStyle.text_14_white_w600,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}