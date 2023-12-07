import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MetaStyles {
  static TextStyle fieldTitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.theme.colorScheme.secondary);
  static TextStyle fieldSubtitleStyle =
      TextStyle(fontSize: 13, color: Get.theme.colorScheme.secondary);
  static TextStyle pageSubtitleStyle =
      TextStyle(color: Get.theme.primaryColor, fontSize: 15);
  static TextStyle pageTitleStyle = GoogleFonts.autourOne(
      fontSize: 25, color: Get.theme.colorScheme.secondary);

// profile
  static TextStyle profileFieldSubtTitleStyle =
      TextStyle(fontSize: 16, color: Get.theme.colorScheme.tertiary);
  static TextStyle profileFieldTitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Get.theme.colorScheme.secondary);
  static TextStyle profileFieldValueStyle = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: Get.theme.colorScheme.secondary);
}
