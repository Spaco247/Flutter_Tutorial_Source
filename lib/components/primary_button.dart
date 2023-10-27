import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final double? textSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  const PrimaryButton({Key? key, required this.title, required this.onTap, this.height, this.width, this.textSize, this.backgroundColor, this.textColor, this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width ?? double.infinity, height: height ?? 60),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? kPrimaryColor,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: BorderSide(
              width: 0.5,
              color: borderColor ?? Colors.white,
            )
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? kPrimaryTextColorDark,
            fontSize: textSize ?? 18
          ),
        )
      ),
    );
  }
}
