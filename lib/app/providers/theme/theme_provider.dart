import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/providers/theme/theme_saver_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final darkModeProvider = AsyncNotifierProvider<ModeNotifier, bool>(ModeNotifier.new);

const lightAppColors = AppColors(
  button: Color(0xFF4CAF50),              // Vibrant lime green for buttons (from "Lime" 500)
  primary: Color.fromARGB(255, 225, 255, 253),             // Light cyan background (inspired by overall light tone)
  secondary: Color(0xFFB2DFDB),           // Softer cyan for surfaces (from "Tiber" lighter shades)
  title: Color(0xFF212121),               // Dark gray for bold headers (from "Fusveous Gray" darker tones)
  text: Color.fromARGB(255, 0, 0, 0),                // Medium gray for readable text
  buttonText: Color(0xFFFFFFFF),          // Crisp white for button text
  links: Color(0xFF2196F3),               // Bright blue for links (from "Tiber" blues)
  border: Color(0xFFB0BEC5),              // Light gray-blue for borders
  appbar: Color(0xFFB2DFDB),              // Fresh cyan for app bar (from "Tiber" 300-400 range)
);



const darkAppColors = AppColors(
  button: Color(0xFFDAB11C),                        // Golden yellow
  primary: Color(0xFF02141D),                       // Deep navy
  secondary: Color(0xFF001E29),                     // Darker contrast
  title: Color(0xFFDAB11C),                         // Same gold for brand
  text: Color(0xFFFFFEFD),                          // Off-white text
  buttonText: Color(0xFF02141D),                    // Dark on gold
  links: Color(0xFF55C3E1),                         // Light blue links
  border: Color(0xFF40565E),                        // Dark grey-blue borders
  appbar: Color.fromARGB(255, 0, 38, 52),                        // Slightly lighter than primary for hierarchy
);

final appColorsProvider = Provider<AppColors>((ref) {
  final isDarkMode = ref.watch(darkModeProvider).value ?? false;
  return isDarkMode ? darkAppColors : lightAppColors;
});
