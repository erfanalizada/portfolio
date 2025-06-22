import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/providers/theme/theme_saver_class.dart';
import 'package:portfolio/app/models/color_model.dart';

final darkModeProvider  = AsyncNotifierProvider<ModeNotifier,bool>(ModeNotifier.new);


const lightAppColors = AppColors(
  button: Colors.white,
  primary: Color(0xFFFFFEFD),
  secondary: Color(0xFFFFFFFF),
  title: Color(0xFF094DBE),
  text: Color(0xFF02141D),
  buttonText: Color(0xFF02141D),
  links: Color(0xFFDAB11C),
  border: Color(0xFF9DA1A2),
);

const darkAppColors = AppColors(
  button: Color(0xFFDAB11C),
  primary: Color(0xFF02141D),
  secondary: Color(0xFF001E29),
  title: Color(0xFFDAB11C),
  text: Color(0xFFFFFEFD),
  buttonText: Color(0xFF02141D),
  links: Color(0xFF55C3E1),
  border: Color(0xFF40565E),
);


final appColorsProvider = Provider<AppColors>((ref) {
  final isDarkMode = ref.watch(darkModeProvider).value ?? false;
  return isDarkMode ? darkAppColors : lightAppColors;
});
