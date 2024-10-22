import 'package:app_test/utils/color_constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOutlineButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? buttonColor;

  const CustomOutlineButton({
    super.key,
    this.height,
    this.width,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = ColorConstants.primaryColor,
  });
// width: 245,
// height: 48,
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize:
            Size(width ?? size.width * 0.65, height ?? size.height * 0.057),
        side: BorderSide(
          width: 1.0,
          color: onPressed == null ? ColorConstants.greyColor : buttonColor!,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(33),
        ),
      ),
      onPressed: onPressed,
      child: AutoSizeText(
        buttonText,
        maxLines: 1,
        minFontSize: 14,
        style: TextStyle(
          color: onPressed == null
              ? ColorConstants.greyColor
              : ColorConstants.primaryColor,
          fontSize: 16,
          fontFamily: "Inter",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
    // return OutlinedButton(
    //     style: OutlinedButton.styleFrom(
    //       fixedSize:
    //           Size(width ?? size.width * 0.65, height ?? size.height * 0.05),
    //       side: BorderSide(width: 1.0, color: buttonColor!),
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(4),
    //       ),
    //     ),
    //     onPressed: onPressed,
    //     child: GetBuilder<LocalDataController>(builder: (controller) {
    //       return Text(
    //         buttonText,
    //         style: TextStyle(
    //           color: buttonColor,
    //           fontSize: controller.selectedLanguageName == "English" ? 17 : 20,
    //           fontWeight: FontWeight.w600,
    //         ),
    //       );
    //     }));
  }
}
