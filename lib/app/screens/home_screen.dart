import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:portfolio/app/managers/text_provider_manager.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/models/image_card_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/widgets/glow_wrapper.dart';
import 'package:portfolio/app/widgets/image_cards_widget.dart';
import 'package:portfolio/app/widgets/responsive_grid.dart';
import 'package:portfolio/app/widgets/small_container.dart';
import 'package:portfolio/app/widgets/toggle_widget.dart';
import 'package:portfolio/app/widgets/hero_widget.dart';
import 'package:portfolio/app/widgets/youtube_hero.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppColors colors = ref.watch(appColorsProvider);
    final ITextBuilder generateText = ref.watch(textProvider);
    final ITextProviderManager cardText = ref.watch(cardTextProvider);

    final card = ImageCard('assets/playing_soccer.png', 'Playing Soccer');

    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        backgroundColor: colors.appbar,
        title: const Text("Test Screen"),
        titleTextStyle: TextStyle(fontSize: 20, color: colors.text),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ToggleWidget(colors: colors),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ResponsiveGrid(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, //means all children will be aligned to start(which is left side).
              children: [
                GlowWrapper(
                  color: colors.links,
                  intensity: 2,
                  hoverIntensity: 25,
                  hoverSpread: 2,
                  radius: 25,
                  child: HeroWidget(colors: colors),
                ),

                const SizedBox(height: 8), // spacing between image and label

                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ), // aligns with image left
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/community.png', height: 35),
                      const SizedBox(width: 8),
                      Text(
                        'Community Projects',
                        style: TextStyle(
                          color: colors.title,
                          fontSize: 22,
                          fontFamily: 'KohSantepheap',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(width: double.infinity, height: 0),

            GlowWrapper(
              color: colors.links,
              intensity: 2,
              hoverIntensity: 25,
              hoverSpread: 2,
              radius: 25,
              child: SmallContainer(
                text: generateText.buildUnorderedList(
                  cardText.flutterThemeChangerText(),
                ),
                title: 'Pub.dev',
                imagePath: 'assets/theme_changer.png',
                colors: colors,
              ),
            ),
            const SizedBox(width: 50, height: 0),

            GlowWrapper(
              color: colors.links,
              intensity: 2,
              hoverIntensity: 25,
              hoverSpread: 2,
              radius: 25,
              child: SmallContainer(
                title: "Pub.dev",
                text: generateText.buildUnorderedList(
                  cardText.customTimePickerText(),
                ),
                imagePath: 'assets/time_picker.png',
                colors: colors,
              ),
            ),
            const SizedBox(width: double.infinity, height: 0),

            YoutubeHeroWidget(colors: colors),
            ImageCardsWidget(card: card, colors: colors),
            const SizedBox(width: double.infinity, height: 0),
          ],
        ),
      ),
    );
  }
}
