import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/app/helpers/web_fullscreen_helper.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/widgets/inside_widget_hover_effect.dart';

class ScreenSizeOverlay extends StatelessWidget {
  final Widget screen;
  final double minWidth;
  final AppColors colors;

  const ScreenSizeOverlay({
    super.key,
    required this.screen,
    this.minWidth = 750,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        screen,
        if (screenWidth < minWidth)
          Positioned.fill(
            child: Container(
              color: colors.primary,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/resize_animation.json',
                    width: 200,
                    repeat: true,
                  ),
                  const SizedBox(height: 30),
                   Text(
                    'Screen Too Small',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: colors.title,
                      decoration: TextDecoration.none,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                   Text(
                    'For the best experience,\nplease expand your screen.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: colors.text,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                      letterSpacing: 0.5,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 24),
                  HoverEffectWrapper(child:   ElevatedButton.icon(
                    onPressed: enterFullscreen,
                    icon: const Icon(Icons.fullscreen),
                    label: const Text('Go Fullscreen'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.title,
                      foregroundColor: colors.secondary,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                    ),
                  ),)

                
                ],
              ),
            ),
          ),
      ],
    );
  }
}
