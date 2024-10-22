import 'package:app_test/widgets/button/custom_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowError extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback? onRetryPressed;
  final double? height;

  const ShowError(
      {Key? key, this.errorMessage, this.onRetryPressed, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: const BoxDecoration(
          //color: ColorConstants.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Text(
                errorMessage!.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomOutlineButton(
                width: width * 0.3,
                height: height * 0.03,
                buttonText: "retry".tr,
                onPressed: onRetryPressed)
          ],
        ),
      ),
    );
  }
}
