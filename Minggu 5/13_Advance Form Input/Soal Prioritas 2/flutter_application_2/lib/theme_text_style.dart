import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeTextStyle {
  TextStyle m3DisplayLarge = GoogleFonts.roboto(
    fontSize: 47,
    fontWeight: FontWeight.w400,
    color: ThemeColor().blackColor,
  );

  TextStyle m3HeadlineSmall = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: ThemeColor().blackColor,
  );

  TextStyle m3BodyMedium = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ThemeColor().blackColor,
  );

  TextStyle m3BodySmall = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightPurple60,
  );

  TextStyle m3BodyLarge = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ThemeColor().m3SysLightPurple60,
  );

    TextStyle m3LabelLarge = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ThemeColor().whiteColor,
  );
  
}