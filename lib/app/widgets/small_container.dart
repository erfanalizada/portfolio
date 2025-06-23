import 'package:flutter/material.dart';
import 'package:portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/widgets/inside_widget_hover_effect.dart';
import 'package:portfolio/app/widgets/yellow_button_widget.dart';

class SmallContainer extends StatelessWidget {
  final String title;
  final String text;
  final String imagePath;
  final AppColors colors;

  const SmallContainer({
    super.key,
    required this.title,
    required this.text,
    required this.imagePath,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: colors.border, width: 2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageWidth = constraints.maxWidth * 0.9;
          final imageHeight = constraints.maxHeight * 0.3;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start, // 👈 Start from top
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16), // Add a little top margin
              // Title
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  style: TextStyle(
                    color: colors.text,
                    fontSize: 20,
                    fontFamily: 'KohSantepheap',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10),

              // Image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.border, width: 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Body text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  text,
                  style: TextStyle(
                    color: colors.text,
                    fontSize: 14,
                    height: 1.4,
                    fontFamily: 'KohSantepheap',
                  ),
                ),
              ),

              const SizedBox(height: 10),

              HoverEffectWrapper(
                scaleFactor: 1.02,
                child: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: YellowButtonWidget(
                      buttonText: 'Read more',
                      callback: () {},
                      colors: colors,
                      icon: const Icon(Icons.arrow_forward_ios),
                      iconPosition: IconPosition.right,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
