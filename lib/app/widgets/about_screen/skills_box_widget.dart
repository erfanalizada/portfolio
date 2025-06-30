import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/widgets/glow_wrapper.dart';
import 'package:flutter/material.dart';


class SkillsBoxWidget extends StatelessWidget {
  final String leftTitle;
  final String rightTitle;
  final List<String> leftImageUrls;
  final List<String> rightImageUrls;
  final AppColors colors;

  const SkillsBoxWidget({
    super.key,
    required this.leftTitle,
    required this.rightTitle,
    required this.leftImageUrls,
    required this.rightImageUrls,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return GlowWrapper(
      color: colors.links,
      intensity: 2,
      hoverIntensity: 25,
      hoverSpread: 2,
      radius: 25,
      child: Container(
        width: 700,
        height: 330,
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: colors.border, // Equivalent to Colors.border
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Left Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    leftTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'KohSantepheap',
                      color: colors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: leftImageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(url, height: 45),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Right Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    rightTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'KohSantepheap',
                      color: colors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: rightImageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.asset(url, height: 45),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
