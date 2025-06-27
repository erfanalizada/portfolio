import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/models/color_model.dart';

class ToggleWidget extends ConsumerWidget {
  final AppColors colors;
  const ToggleWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider).value ?? false;
    final modeNotifier = ref.read(darkModeProvider.notifier);

    // Color logic based on current mode
    final Color toggleColor = isDarkMode ? colors.links : colors.button;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.wb_sunny, size: 20, color: isDarkMode ? colors.border : colors.button),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Switch(
            value: isDarkMode,
            onChanged: (_) => modeNotifier.toggle(),

            activeColor: toggleColor,                         // Thumb when ON
            activeTrackColor: toggleColor.withValues(alpha:0.4),   // Track when ON
            inactiveThumbColor: toggleColor,                  // Thumb when OFF
            inactiveTrackColor: toggleColor.withValues(alpha:0.3), // Track when OFF

            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        Icon(Icons.nightlight_round, size: 20, color: isDarkMode ? colors.links : colors.border),
      ],
    );
  }
}
