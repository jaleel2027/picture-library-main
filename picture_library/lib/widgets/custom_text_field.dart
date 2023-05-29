import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picture_library/utils/color_utilities.dart';

class CustomTextField extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? labelText;
  final String? hintText;
  final double? radius;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextEditingController? controller;
  const CustomTextField(
      {super.key,
      this.onChanged,
      this.inputFormatters,
      this.prefixIcon,
      this.labelText,
      this.radius,
      this.keyboardType,
      this.suffixIcon,
      this.hintText,
      this.obscureText,
      this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      shadowColor: ColorUtilities.blueshadowColor,
      borderRadius: BorderRadius.circular(widget.radius ?? 30),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText ?? false,
        controller: widget.controller,
        style: const TextStyle(
          color: ColorUtilities.blueColor,
        ),
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 30),
              borderSide:
                  const BorderSide(color: ColorUtilities.blueColor, width: 0.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 30),
              borderSide: const BorderSide(
                color: ColorUtilities.blueColor,
              ),
            ),
            border: InputBorder.none,
            labelStyle: const TextStyle(
              color: ColorUtilities.blueColor,
            ),
            filled: true,
            fillColor: ColorUtilities.whiteColor,
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: ColorUtilities.blackColor.withOpacity(0.6),
            ),
            suffixIcon: widget.suffixIcon),
      ),
    );
  }
}
