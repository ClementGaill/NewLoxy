// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

const textColor = Color(0xFF080C14);
const backgroundColor = Color(0xFFF1F3FA);
const primaryColor = Color(0xFF5670BE);
const primaryFgColor = Color(0xFFF1F3FA);
const secondaryColor = Color(0xFFB89CD9);
const secondaryFgColor = Color(0xFF080C14);
const accentColor = Color(0xFFAF6EC7);
const accentFgColor = Color(0xFF080C14);
const greyColor = Color(0xFF687684);
  
const colorScheme = ColorScheme(
  brightness: Brightness.light,
  background: backgroundColor,
  onBackground: textColor,
  primary: primaryColor,
  onPrimary: primaryFgColor,
  secondary: secondaryColor,
  onSecondary: secondaryFgColor,
  tertiary: accentColor,
  onTertiary: accentFgColor,
  surface: backgroundColor,
  onSurface: textColor,
  error: Brightness.light == Brightness.light ? Color(0xffB3261E) : Color(0xffF2B8B5),
  onError: Brightness.light == Brightness.light ? Color(0xffFFFFFF) : Color(0xff601410),
);