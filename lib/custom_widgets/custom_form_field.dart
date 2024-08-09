import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool security;
  final TextInputType inputType;
  final String? validation;
  final Function(dynamic)? saved;
  final int maxLine;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String)? onChanged;
  final int? number;
  final String? labelText;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final TextStyle hintStyle;
  final String? initialValue;

  const CustomFormField({
    Key? key,
    this.controller,
    this.hintText,
    this.inputType = TextInputType.text,
    this.saved,
    this.validation,
    this.security = false,
    this.maxLine = 1,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.labelText,
    this.number,
    this.hintTextColor,
    this.labelTextColor,
    this.initialValue,
    this.hintStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14.0,
      fontFamily: 'URW',
      color: TColor.textFormFieldHint,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 359.w,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty || value.length < number!) {
            return validation;
          }
          return null;
        },
        onSaved: saved,
        obscureText: security,
        maxLines: maxLine,
        keyboardType: inputType,
        onChanged: onChanged,
        initialValue: initialValue,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          prefixIcon: prefix,
          suffixIcon: suffix,
          hintText: hintText,
          labelText: labelText,
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.w),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: hintStyle,
          labelStyle: const TextStyle(
            fontFamily: 'URW',
            color: TColor.color79,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: TColor.color18,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: TColor.color18,),
          ),
        ),
      ),
    );
  }
}
