import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final bool? obscureText, enabled, autofocus, autocorrect, showCursor, readOnly, expands;
  final String? initialValue;
  final Color? cursorColor, cursorErrorColor;
  final AutovalidateMode? autoValidateMode;
  final double? cursorHeight;
  final FocusNode? focusNode;
  final TextStyle? style;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;

  AppTextFormFieldWidget({
    super.key,
    required this.controller,
    this.decoration,
    required this.keyboardType,
    this.validator,
    this.textInputAction,
    this.obscureText,
    this.enabled,
    this.autofocus,
    this.autocorrect,
    this.showCursor,
    this.readOnly,
    this.expands,
    this.initialValue,
    this.cursorColor,
    this.cursorErrorColor,
    this.autoValidateMode,
    this.cursorHeight,
    this.focusNode,
    this.style,
    this.textAlign,
    this.inputFormatters, this.onTap,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    //key: textFormKey,
    initialValue: initialValue,
    enabled: enabled,
    inputFormatters: inputFormatters,
    controller: controller,
    decoration: decoration, // Use the red/white decoration
    keyboardType: keyboardType,
    validator: validator,
    textInputAction: textInputAction,
    obscureText: obscureText ?? false,
    autofocus: autofocus ?? false,
    autocorrect: autocorrect ?? false,
    cursorColor: cursorColor, // White cursor
    showCursor: showCursor ?? false,
    autovalidateMode: autoValidateMode,
    cursorErrorColor: cursorErrorColor,
    cursorHeight: cursorHeight,
    focusNode: focusNode,
    style: style, // White text color
    textAlign: textAlign ?? TextAlign.left,
    readOnly: readOnly ?? false,
    expands: expands ?? false,
    onTap: onTap,
  ); /*TextFormField(
    key: textFormKey,
    initialValue: initialValue,
    enabled: enabled,
    inputFormatters: inputFormatters,
    controller: controller,
    decoration: decoration,
    keyboardType: keyboardType,
    validator: validator,
    textInputAction: textInputAction,
    obscureText:obscureText ?? false,
    autofocus: autofocus ?? false,
    autocorrect: autocorrect ?? false,
    cursorColor: cursorColor,
    showCursor: showCursor ?? false,
    autovalidateMode: autoValidateMode,
    cursorErrorColor: cursorErrorColor,
    cursorHeight: cursorHeight,
    focusNode: focusNode,
    style: style,
    textAlign: textAlign ?? TextAlign.center,
    readOnly: readOnly ?? false,
    expands: expands ?? false,
  );*/
}
