import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';

class PrimaryPasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hint;
  final Function()? onTap;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final Function(String?)? onChange;
  final bool obscureText;
  const PrimaryPasswordInputField({Key? key, required this.controller, this.validator, required this.hint, this.onTap, this.suffixIcon, this.contentPadding, this.onChange, required this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      textInputAction: TextInputAction.next,
      style: TextStyle(
        color: kPrimaryTextColorDark
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: kTextInputHintColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kTextInputBorderColor
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: kTextInputBorderColor
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.red.shade400
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.red.shade400
          )
        ),
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 18, vertical: 20),

        prefixIconConstraints: const BoxConstraints.tightFor(
          width: 48
        ),
        /*filled: true,
        fillColor: Colors.grey.shade100*/
      ),
      validator: validator,
      onTap: onTap,
      onChanged: onChange,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
