import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:okeowo/presentation/utils/components/app_font/app_font.dart';
import 'package:okeowo/presentation/utils/components/appcolor/appcolor.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput(
      {Key? key,
      required this.controller,
      this.autovalidateMode,
      required this.validator,
      this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.prefixIcon,
      this.onChanged,
      this.onTap,
      this.inputFormatters,
      this.enabled,
      this.textLength,
      this.isBorderRadius = false,
      this.isColor = Colors.black,
      this.fillColor = Colors.white,
      this.filled = false,
      this.showBorder = true,
      this.borderColor = true,
      this.readOnly = false,
      this.borderRadius = 25,
      this.onFieldSubmitted,
      this.keyboardType})
      : super(key: key);

  final String? labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool readOnly;
  final bool borderColor;
  final bool filled;
  final bool showBorder;
  final double borderRadius;
  final Widget? prefixIcon;
  final bool isBorderRadius;
  final Color isColor;
  final Color fillColor;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?) validator;
  // final TextCapitalization capitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? textLength;
  final void Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      cursorColor: isColor,
      readOnly: readOnly,
      // maxLength: textLength,
      // maxLengthEnforcement: MaxLengthEnforcement.enforced,
      autovalidateMode: autovalidateMode,
      textCapitalization: TextCapitalization.words,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.black54,
          fontSize: 16.sp,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w500),
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        errorStyle: Theme.of(context)
            .textTheme
            .labelSmall
            ?.copyWith(color: Colors.red, letterSpacing: 0.5, fontSize: 15.sp),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        iconColor: Colors.grey,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(width: 0.5, color: Colors.black)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              width: 0.5,
              color: borderColor ? Colors.grey.shade300 : Colors.white,
            )
            //<-- SEE HERE
            ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: borderColor ? Colors.grey.shade400 : Colors.white,
              width: 0.5,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: borderColor ? AppColors.primaryColor : Colors.white,
              width: 0.5,
            )),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: labelText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontFamily: OkwFont.book,
            color: Colors.black38,
            fontSize: 16.sp,
            letterSpacing: 0.0),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(20.0),
        //   ),
        // )
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,

      onTap: onTap,
    );
  }
}
