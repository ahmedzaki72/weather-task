import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weathertask/config/theme_colors.dart';

class CustomFormFieldWithBorder extends StatelessWidget {
  final String? hintText;
  final bool security;
  final TextInputType inputType;
  final String? validation;
  final Function(dynamic)? saved;
  final int maxLine;
  final Widget? prefix;
  final Widget? suffix;
  final double? radiusNumber;
  final Function(String)? onChanged;
  final int? number;
  final double? paddingLeft;
  final double? paddingRight;
  final double? formFieldWidth;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final Color? fillColor;
  final Color? borderColor;
  final Function(String)? onEditingSubmit;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool needHeight;
  final bool readOnly;
  final String? initialValue;
  final TextStyle textStyleHint;
  final bool checkOnlyRadiusTop;

  const CustomFormFieldWithBorder({
    super.key,
    this.hintText,
    this.inputType = TextInputType.text,
    this.saved,
    this.validation,
    this.security = false,
    this.onEditingSubmit,
    this.maxLine = 1,
    this.prefix,
    this.suffix,
    this.radiusNumber = 5,
    this.onChanged,
    this.controller,
    this.fillColor = TColor.fillFormField,
    this.borderColor = TColor.borderHomeSearch,
    this.paddingLeft = 20,
    this.paddingRight = 20,
    this.formFieldWidth = 328,
    this.contentPaddingVertical = 12,
    this.contentPaddingHorizontal = 10,
    this.focusNode,
    this.number,
    this.needHeight = false,
    this.readOnly = false,
    this.checkOnlyRadiusTop = false,
    this.initialValue,
    this.textStyleHint = const TextStyle(
      color: TColor.color4,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: "URW",
    ),
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft!.w, right: paddingRight!.w),
      child: needHeight
          ? SizedBox(
              width: formFieldWidth!.w,
              height: 50.w,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: onChanged,
                controller: controller,
                focusNode: focusNode,
                initialValue: initialValue,
                readOnly: readOnly,
                onFieldSubmitted: onEditingSubmit,
                decoration: InputDecoration(
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  filled: true,
                  fillColor: fillColor,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: contentPaddingVertical!,
                      horizontal: contentPaddingHorizontal!),
                  hintText: hintText,
                  hintStyle: textStyleHint,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                  border: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                ),
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
              ),
            )
          : SizedBox(
              width: formFieldWidth!.w,
              child: TextFormField(
                onChanged: onChanged,
                controller: controller,
                focusNode: focusNode,
                initialValue: initialValue,
                readOnly: readOnly,
                onFieldSubmitted: onEditingSubmit,
                decoration: InputDecoration(
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  filled: true,
                  isDense: true,
                  fillColor: fillColor,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: contentPaddingVertical!,
                      horizontal: contentPaddingHorizontal!),
                  hintText: hintText,
                  hintStyle: textStyleHint,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                  border: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: checkOnlyRadiusTop
                          ? BorderRadius.only(
                              topLeft: Radius.circular(radiusNumber!),
                              topRight: Radius.circular(radiusNumber!))
                          : BorderRadius.circular(radiusNumber!),
                      borderSide: BorderSide(color: borderColor!, width: 1)),
                ),
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
              ),
            ),
    );
  }
}
