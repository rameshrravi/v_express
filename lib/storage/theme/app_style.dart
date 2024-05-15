import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class AppStyle {
  double textscale = MediaQuery.of(Get.context!).textScaleFactor;

  static double getPlatformFontSize(double androidSize, double iosSize) {
    return Platform.isAndroid ? androidSize : iosSize;
  }

  static TextStyle? setDashboardName(
      {required BuildContext context,
      Color color = Colors.black,
      overflow = TextOverflow.ellipsis,
      letterSpacing = 0.0,
      double height = 0.0}) {
    return context.isTablet
        ? context.textTheme.titleLarge
            ?.copyWith(fontSize: 27, fontWeight: FontWeight.bold)
        : context.theme.textTheme.titleMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: getPlatformFontSize(14, 15),
            letterSpacing: 0.3,
            overflow: overflow,
            height: height,
          );
  }

  static TextStyle? setReferenceName(
      {required BuildContext context, Color color = Colors.black}) {
    return Get.context!.theme.textTheme.titleSmall!.copyWith(
        color: color,
        fontSize: context.isTablet ? 22 : getPlatformFontSize(12, 13),
        height: 1.0);
  }

  static TextStyle? setHeaderName(
      {required BuildContext context,
      Color color = Colors.black,
      overflow = TextOverflow.ellipsis,
      letterSpacing = 0.0}) {
    return context.isTablet
        ? context.textTheme.titleLarge?.copyWith(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            overflow: overflow,
          )
        : Get.context!.theme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.8,
            fontSize: 17,
            overflow: overflow,
          );
  }

  static TextStyle? setSubjectName(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.titleLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: ColorConstant.gray700)
        : context.theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.7,
            fontSize: getPlatformFontSize(12, 13),
          );
  }

  static TextStyle? setActualMessage(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.bodyMedium
            ?.copyWith(fontSize: 20, color: ColorConstant.gray700)
        : Get.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.grey[600],
            fontSize: getPlatformFontSize(12, 13),
            letterSpacing: 0.1,
            height: 1.1);
  }

  static TextStyle? setCount(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.bodyMedium
            ?.copyWith(fontSize: 21, fontWeight: FontWeight.bold)
        : Get.theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: getPlatformFontSize(12, 12),
            color: color,
          );
  }

  static TextStyle? setHeaderRef(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.labelLarge?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: color,
          )
        : context.theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: color,
          );
  }

  static TextStyle? setHeaderdesignation(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: color,
            fontSize: 23,
          )
        : context.theme.textTheme.titleMedium!
            .copyWith(fontWeight: FontWeight.w500, color: color, height: 1.0);
  }

  static TextStyle? setMsgScreenSubject(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 21,
            fontWeight: FontWeight.w500,
          )
        : Get.context!.theme.textTheme.bodyMedium!
            .copyWith(fontSize: 17, color: ColorConstant.gray800);
  }

  static TextStyle? setMsgScreenActualMsg(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          )
        : Get.context!.theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
          );
  }

  static TextStyle? setTags(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.bodyLarge?.copyWith(
            fontSize: 23,
            fontWeight: FontWeight.w400,
            color: color,
          )
        : Get.context!.theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: color,
          );
  }

  static TextStyle? setTagName(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.bodyLarge?.copyWith(
            fontSize: 23,
            fontWeight: FontWeight.w400,
            color: ColorConstant.AoGreen,
          )
        : Get.context!.theme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
            color: ColorConstant.AoGreen,
          );
  }

  static TextStyle? setAddressTo(
      {required BuildContext context, Color color = Colors.black}) {
    return context.theme.textTheme.titleMedium!
        .copyWith(fontWeight: FontWeight.w700, color: color);
  }

  static TextStyle? setTimeMsgScreen(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: color,
          )
        : Get.context!.theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            color: color,
          );
  }

  static TextStyle? setDashboardTime(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.titleMedium
            ?.copyWith(fontSize: 21, color: ColorConstant.gray700)
        : Get.context!.theme.textTheme.titleMedium!.copyWith(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
  }

  static TextStyle? setTitleLarge(
      {required BuildContext context,
      Color color = Colors.black,
      FontWeight? fontWeight = FontWeight.w500,
      double? letterSpacing}) {
    return context.isTablet
        ? context.textTheme.titleLarge?.copyWith(
            fontSize: 24,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing)
        : Get.context!.theme.textTheme.titleLarge!.copyWith(
            fontWeight: fontWeight, color: color, letterSpacing: letterSpacing);
  }

  static TextStyle? setTitleMedium(
      {required BuildContext context,
      Color color = Colors.black,
      FontWeight? fontWeight = FontWeight.w500,
      double? letterSpacing}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 24,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing)
        : Get.context!.theme.textTheme.titleMedium!.copyWith(
            fontWeight: fontWeight, color: color, letterSpacing: letterSpacing);
  }

  static TextStyle? setTitleSmall(
      {required BuildContext context,
      Color color = Colors.black,
      FontWeight? fontWeight = FontWeight.w500,
      double? letterSpacing}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 24,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing)
        : Get.context!.theme.textTheme.bodyLarge!.copyWith(
            fontWeight: fontWeight, color: color, letterSpacing: letterSpacing);
  }

  static TextStyle? setBodyLarge(
      {required BuildContext context,
      Color color = Colors.black,
      FontWeight? fontWeight = FontWeight.w500,
      double? letterSpacing}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 24,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing)
        : Get.context!.theme.textTheme.bodyLarge!.copyWith(
            fontWeight: fontWeight, color: color, letterSpacing: letterSpacing);
  }

  static TextStyle? setBodyMedium(
      {required BuildContext context,
      Color color = Colors.black,
      FontWeight? fontWeight = FontWeight.w500,
      double? letterSpacing}) {
    return context.isTablet
        ? context.textTheme.titleMedium
            ?.copyWith(fontSize: 21, color: color, letterSpacing: letterSpacing)
        : Get.context!.theme.textTheme.titleMedium!.copyWith(
            color: color,
            fontSize: 12,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing);
  }

  static TextStyle? setBodySmall(
      {required BuildContext context,
      Color color = Colors.black,
      FontWeight? fontWeight = FontWeight.w500,
      double? letterSpacing}) {
    return context.isTablet
        ? context.textTheme.titleMedium?.copyWith(
            fontSize: 24,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing)
        : Get.context!.theme.textTheme.bodySmall!.copyWith(
            fontWeight: fontWeight, color: color, letterSpacing: letterSpacing);
  }

  static TextStyle? setFeqAcessName(
      {required BuildContext context, Color color = Colors.black}) {
    return context.isTablet
        ? context.textTheme.labelLarge
            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20)
        : context.theme.textTheme.titleSmall!.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            overflow: TextOverflow.ellipsis
            //  fontSize:  appUtils.getFontSize(15, 18)
            );
  }
}
