import 'package:erfan_portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/widgets/yellow_button_widget.dart';
import 'package:flutter/material.dart';


class SmallContainer extends StatelessWidget {
  final String? title;
  final String text;
  final String imagePath;
  final AppColors colors;
  final VoidCallback callback;

  const SmallContainer({
    super.key,
    this.title,
    required this.text,
    required this.imagePath,
    required this.colors,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 300,
        minWidth: 0,
      ),
      height: 420,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title!,
                  style: TextStyle(
                    color: colors.text,
                    fontSize: 20,
                    fontFamily: 'KohSantepheap',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: imageWidth,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.border, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(height: 14),
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
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: YellowButtonWidget(
                  buttonText: 'Read more',
                  callback: callback,
                  colors: colors,
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconPosition: IconPosition.right,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
