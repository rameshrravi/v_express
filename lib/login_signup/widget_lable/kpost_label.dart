import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget KPOSTFormLabel(String labelText, [TextStyle? style]) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, bottom: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: style ??
              Get.context!.theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        )
      ],
    ),
  );
}

Widget KPOSTFormHeading(String labelText) {
  return Builder(builder: (context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(labelText,
            style: context.isTablet
                ? context.textTheme.bodySmall
                : Get.context!.theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            textAlign: TextAlign.left),
      ),
    );
  });
}

Widget KPOSTPageHeading(String labelText) {
  return Builder(builder: (context) {
    return Row(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 9.0, right: 8.0, top: 8.0),
          child: Image.asset(
            "ImageConstants.IC_LAUNCHER",
            fit: BoxFit.contain,
            scale: 5,
          ),
        ),
      ),
      Text(labelText,
          style: context.isTablet
              ? Get.context!.theme.textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Get.context!.theme.primaryColor,
                )
              : Get.context!.theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Get.context!.theme.primaryColor,
                ),
          textAlign: TextAlign.left)
    ]);
  });
}

Widget KPOSTFormText(String labelText, TextStyle style) {
  return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        labelText,
        style: style,
      ));
}

Widget buttomSignuplable(VoidCallback callback) {
  return Builder(builder: (context) {
    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          KPOSTFormLabelTextWithStyle(
            'need_an_account'.tr,
            context.isTablet
                ? context.textTheme.labelLarge!.copyWith(fontSize: 28)
                : Get.context!.theme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
          ),
          //txtNunito12w400gray80001),
          InkWell(
            onTap: () {
              callback();
            },
            child: KPOSTFormLabelTextWithStyle(
              'sign_up'.tr,
              context.isTablet
                  ? context.textTheme.labelLarge!.copyWith(
                      fontSize: 24, color: Get.context!.theme.primaryColor)
                  : Get.context!.theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Get.context!.theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  });
}

Widget KPOSTFormLabelTextWithStyle(String labelText, TextStyle? style) {
  return Padding(
    padding: const EdgeInsets.only(left: 0.0, bottom: 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: style,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget KPOSTFormLabelTextWithStyleNew(String labelText, TextStyle? style) {
  return SizedBox(
    width: 150,
    child: Text(
      labelText,
      style: style,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
