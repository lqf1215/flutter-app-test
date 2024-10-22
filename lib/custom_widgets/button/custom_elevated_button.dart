import 'package:app_test/utils/common_color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? buttonColor;

  const CustomElevatedButton({
    super.key,
    this.height,
    this.width,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor = CommonColor.primary,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? size.width, height ?? size.height * 0.057),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: CommonColor.primary,
        ),
        onPressed: onPressed,
        child: AutoSizeText(
          buttonText,
          maxLines: 1,
          minFontSize: 14,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
