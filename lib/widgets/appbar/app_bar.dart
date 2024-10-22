import 'package:app_test/Utils/color_constants.dart';
import 'package:app_test/controllers/local_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


AppBar customAppbar({String? title, List<Widget>? actionsList}) {
  return AppBar(
    centerTitle: true,
    title: GetBuilder<LocalDataController>(builder: (controller) {
      return Text(
        title ?? "",
        style: TextStyle(
            fontSize: 17,
            fontFamily: 'Lantinghei SC',
            fontWeight: FontWeight.w600,
            letterSpacing: controller.selectedLanguageCode == "en" ? 0.1 : 1),
      );
    }),
    backgroundColor: ColorConstants.whiteBackground,
    forceMaterialTransparency: true,
    actions: actionsList ?? [],
  );
}
