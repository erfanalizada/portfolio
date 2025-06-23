import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:portfolio/app/models/color_model.dart';

class YellowButtonWidget extends ConsumerWidget {
  final String buttonText;
  final VoidCallback callback;
  final AppColors colors;
  final Icon? icon;
  final IconPosition iconPosition;

  const YellowButtonWidget({
    super.key,
    required this.buttonText,
    required this.callback,
    required this.colors,
    this.icon,
    this.iconPosition = IconPosition.left,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 135,
      height: 35,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.button,
          foregroundColor: colors.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Text centered regardless of icon
            Center(
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 14, fontFamily: 'KohSantepheap', fontWeight: FontWeight.bold
),
                textAlign: TextAlign.center,

              ),
            ),

            // Icon pinned to left or right edge
            if (icon != null)
              Align(
                alignment: iconPosition == IconPosition.left
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: icon!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
