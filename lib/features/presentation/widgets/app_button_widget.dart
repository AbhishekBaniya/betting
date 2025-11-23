import 'package:flutter/material.dart';

import '../../../core/utils/enums/arrow_button_enum.dart';
class AppButtonWidget extends StatelessWidget {
  final Color? buttonColor, buttonBorderColor, buttonLabelColor;
  final Color? leftArrowColor, rightArrowColor;
  final String? buttonLabel;
  final double? height;
  final VoidCallback? onTap;

  /// ✅ Replace booleans with ENUM
  final ButtonArrowType arrowType;

  const AppButtonWidget({
    super.key,
    this.buttonColor,
    this.buttonBorderColor,
    this.buttonLabel,
    this.buttonLabelColor,
    this.leftArrowColor,
    this.rightArrowColor,
    this.height = 46,
    this.arrowType = ButtonArrowType.none, this.onTap,
  });

  bool get showLeft => arrowType == ButtonArrowType.left || arrowType == ButtonArrowType.both;
  bool get showRight => arrowType == ButtonArrowType.right || arrowType == ButtonArrowType.both;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            width: 2.0,
            color: buttonBorderColor ?? Colors.grey,
          ),
        ),
        child: Row(
          children: [
            /// LEFT ARROW
            showLeft
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_left_outlined,
                  color: leftArrowColor ?? Colors.white),
            )
                : const SizedBox(width: 34),

            /// LABEL
            Expanded(
              child: Center(
                child: Text(
                  buttonLabel ?? "",
                  style: TextStyle(
                    color: buttonLabelColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            /// RIGHT ARROW
            showRight
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_right_outlined,
                  color: rightArrowColor ?? Colors.white),
            )
                : const SizedBox(width: 34),
          ],
        ),
      ),
    );
  }
}

