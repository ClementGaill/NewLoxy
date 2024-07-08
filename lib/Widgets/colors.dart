// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

const textColor = Color(0xFF040609);
const backgroundColor = Color(0xFFfafbfd);
const primaryColor = Color(0xFF5e83b6);
const primaryFgColor = Color(0xFF040609);
const secondaryColor = Color(0xFFd4a0a9);
const secondaryFgColor = Color(0xFF040609);
const accentColor = Color(0xFFc5a97f);
const accentFgColor = Color(0xFF040609);
  
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

const greyColor = Color.fromARGB(255, 76, 87, 97);