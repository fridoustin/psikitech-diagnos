import 'package:flutter/material.dart';
import 'package:psikitech_diagnos/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  primaryColor: AppColors.primaryColor,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
  primaryTextTheme: primaryTextTheme,
  textTheme: primaryTextTheme
);

final TextTheme primaryTextTheme = GoogleFonts.montserratTextTheme().copyWith(
  titleLarge: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryBlack,
  ),
  titleMedium: GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryBlack,
  ),
  titleSmall: GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryBlack,
  ),
  labelLarge: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlack,
  ),
  labelMedium: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlack,
  ),
  labelSmall: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlack,
  ),
  bodyLarge: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryBlack,
  ),
  bodyMedium: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryBlack,
  ),
  bodySmall: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryBlack,
  ),
);