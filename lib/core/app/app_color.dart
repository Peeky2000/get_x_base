import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColor {
  Color? primaryColor;
  Color? secondary1;
  Color? secondary2;
  Color? backgroundColor;
  Color? textColor;
  Color? textColorButton;
  Color?  textColorLight;
  Color? textColorPrimary;
  Color? borderColor;
  Color? redBase;
  Color? iconColor;
  Color? tertiary;
  Color? gray700;
  Color? purple500;
  Color? grayScale300;
  Color? grayScale500;
  Color? purple300;
  Color? purple400;
  Color? grayScale400;
  Color? orange200;
  Color? greyScaleContent;

  AppColor() {
    if (Get.isDarkMode) {
      setupDarkMode();
    } else {
      setupLightMode();
    }
  }

  void setupLightMode() {
    primaryColor = const Color(0xFF2BCB57);
    secondary1 = const Color(0xFF379237);
    secondary2 = const Color(0xFF82CD47);
    backgroundColor = const Color(0xFFF5F5FA);
    textColor = const Color(0xFF505050);
    textColorButton = const Color(0xFFFFFFFF);
    textColorLight = const Color(0xFFCECECE);
    textColorPrimary = const Color(0xFF2BCB57);
    borderColor = const Color(0xFFCECECE);
    redBase = const Color(0xFFF84F31);
    iconColor = const Color(0xFF5C5C5C);
    tertiary = const Color(0xFF455662);
    gray700 = const Color(0xFF344054);
    purple500 = const Color(0xFF0D006A);
    grayScale300 = const Color(0xFF9DA4AE);
    grayScale400 = const Color(0xFF6C737F);
    grayScale500 = const Color(0xFF1F2A37);
    purple300 = const Color(0xFF4E49D6);
    purple400 = const Color(0xFF352CBE);
    orange200 = const Color(0xFFF3633E);
    greyScaleContent = const Color(0xFF1A1A1A);
  }

  void setupDarkMode() {
    primaryColor = const Color(0xFF2BCB57);
    secondary1 = const Color(0xFF379237);
    secondary2 = const Color(0xFF82CD47);
    backgroundColor = const Color(0xFFFFFFFF);
    textColor = const Color(0xFF505050);
    textColorButton = const Color(0xFFFFFFFF);
    textColorLight = const Color(0xFFCECECE);
    textColorPrimary = const Color(0xFF2BCB57);
    borderColor = const Color(0xFFCECECE);
    redBase = const Color(0xFFF84F31);
    iconColor = const Color(0xFF5C5C5C);
    tertiary = const Color(0xFF455662);
    gray700 = const Color(0xFF344054);
    purple500 = const Color(0xFF0D006A);
    grayScale300 = const Color(0xFF9DA4AE);
    grayScale400 = const Color(0xFF6C737F);
    grayScale500 = const Color(0xFF1F2A37);
    purple300 = const Color(0xFF4E49D6);
    purple400 = const Color(0xFF352CBE);
    orange200 = const Color(0xFFF3633E);
    greyScaleContent = const Color(0xFF1A1A1A);
  }
}
