import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gososmed_app/core/constant/colors.dart';

class AppStyles {
  AppStyles._();

  static TextStyle textStyleAppBar() => const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleTextBody14({Color? colorText, double? size = 14, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.inter(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody12({Color? colorText, double? size = 12, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.inter(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody16({Color? colorText, double? size = 16, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.inter(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody18({Color? colorText, double? size = 18, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody20({Color? colorText, double? size = 20, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody25({Color? colorText, double? size = 25, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody36({Color? colorText, double? size = 36, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody40({Color? colorText, double? size = 40, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.notoSansOldItalic(
        color: colorText ?? AppColors.textBlack,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static InputDecoration inputDecorationFloating(String floatingLabel, String hint, {Widget? suffixIcon, bool? disableLabel}) => InputDecoration(
        label: disableLabel != null && disableLabel ? null : Text(floatingLabel, style: AppStyles.styleTextBody20(colorText: AppColors.pink, fontWeight: FontWeight.bold)),
        hintText: hint,
        suffixIcon: suffixIcon,
        floatingLabelStyle: AppStyles.styleTextBody20(colorText: AppColors.pink, fontWeight: FontWeight.bold),
        hintStyle: AppStyles.styleTextBody16(colorText: AppColors.grayMedium),
        contentPadding: const EdgeInsets.only(left: 25, top: 25, bottom: 25),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.pink,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        fillColor: AppColors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      );
  static BoxShadow bottomShadow = const BoxShadow(color: Colors.black26, blurRadius: 1, spreadRadius: 0, offset: Offset(0, 1));
}
