import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/models/image_card_model.dart';
import 'package:flutter/cupertino.dart';


class ImageCardsWidget extends StatelessWidget {
  final ImageCard card;
  final AppColors colors;
  final double cardWidth;
  final double cardHeight;

  const ImageCardsWidget({
    super.key,
    required this.card,
    required this.colors,
    this.cardWidth = 200,
    this.cardHeight = 300, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: colors.border,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              card.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          card.text,
          style: TextStyle(
            color: colors.text,
            fontSize: 18,
            fontFamily: 'KohSantepheap',
          ),
        ),
      ],
    );
  }
}
