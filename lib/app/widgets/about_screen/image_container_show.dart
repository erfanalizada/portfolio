import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/models/image_card_model.dart';
import 'package:erfan_portfolio/app/widgets/about_screen/image_cards_widget.dart';
import 'package:erfan_portfolio/app/widgets/glow_wrapper.dart';
import 'package:erfan_portfolio/app/widgets/responsive_grid.dart';
import 'package:flutter/widgets.dart';


class ImageContainerShow extends StatelessWidget {
  final AppColors colors;
  const ImageContainerShow({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    final soccerCard = ImageCard('assets/playing_soccer.png', 'Playing Soccer');
    final readingBook = ImageCard('assets/reading_book.png', 'Reading Book');
    final natureLover = ImageCard('assets/nature.png', 'Nature Lover');
    final github = ImageCard(
      'assets/github.png',
      'Creating demo software\npracticing new features',
    );
    final barbecueMaster = ImageCard('assets/barb.png', 'Barbecue master');
    final pubDev = ImageCard(
      'assets/pub.png',
      'Creating flutter\ncommunity packages',
    );

    return  GlowWrapper(
        color: colors.links,
        intensity: 2,
        hoverIntensity: 25,
        hoverSpread: 2,
        radius: 25,
        child: Container(
          width: 700,
          height: 700,
          decoration: BoxDecoration(
            color: colors.secondary,
            border: Border.all(color: colors.border, width: 2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: ResponsiveGrid(
            spacing: 12,
            runSpacing: 16,
            children: [
              ImageCardsWidget(
                card: soccerCard,
                colors: colors,
                cardWidth: 200,
                cardHeight: 270,
              ),
              ImageCardsWidget(
                card: readingBook,
                colors: colors,
                cardWidth: 200,
                cardHeight: 270,
              ),
              ImageCardsWidget(
                card: natureLover,
                colors: colors,
                cardWidth: 200,
                cardHeight: 270,
              ),
              ImageCardsWidget(
                card: github,
                colors: colors,
                cardWidth: 200,
                cardHeight: 270,
              ),
              ImageCardsWidget(
                card: barbecueMaster,
                colors: colors,
                cardWidth: 200,
                cardHeight: 270,
              ),
              ImageCardsWidget(
                card: pubDev,
                colors: colors,
                cardWidth: 200,
                cardHeight: 270,
              ),
            ],
          ),
        ),
   
    );
  }
}
