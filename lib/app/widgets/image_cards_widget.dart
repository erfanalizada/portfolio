import 'package:flutter/cupertino.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/models/image_card_model.dart';

class ImageCardsWidget extends StatelessWidget {
  final ImageCard card;
  final AppColors colors;

  const ImageCardsWidget({
    super.key,
    required this.card,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 300,
            maxHeight: 400,
            minWidth: 0,
          ),
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
