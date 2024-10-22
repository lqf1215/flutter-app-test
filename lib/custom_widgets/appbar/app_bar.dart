import 'package:app_test/Utils/color_constants.dart';
import 'package:flutter/material.dart';

AppBar customAppbar({String? title, List<Widget>? actionsList}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title ?? "",
      style: const TextStyle(
        fontSize: 17,
        color: ColorConstants.blackBackground,
        fontFamily: 'Lantinghei SC',
        fontWeight: FontWeight.w600,
      ),
    ),
    iconTheme: const IconThemeData(color: ColorConstants.blackBackground),
    backgroundColor: ColorConstants.whiteBackground,
    forceMaterialTransparency: true,
    actions: actionsList ?? [],
  );
}
