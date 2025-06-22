import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/models/color_model.dart'; // your AppColors model

class ToggleWidget extends ConsumerWidget {
  final AppColors colors;
  const ToggleWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider).value ?? false;
    final modeNotifier = ref.read(darkModeProvider.notifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.wb_sunny, color: isDarkMode ? colors.border : colors.links),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Switch(
            value: isDarkMode,
            onChanged: (_) => modeNotifier.toggle(),
            activeColor: colors.links,              // thumb when ON
            activeTrackColor: colors.border,        // track when ON
            inactiveThumbColor: colors.buttonText,  // thumb when OFF
            inactiveTrackColor: colors.border.withValues(alpha: 0.3), // track when OFF
          ),
        ),
        Icon(Icons.nightlight_round, color: isDarkMode ? colors.links : colors.border),
      ],
    );
  }
}
