import 'package:erfan_portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:erfan_portfolio/app/interfaces/i_link_manager.dart';
import 'package:erfan_portfolio/app/interfaces/i_navigation_manager.dart';
import 'package:erfan_portfolio/app/interfaces/i_text_builder.dart';
import 'package:erfan_portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/providers/managers/manager_providers.dart';
import 'package:erfan_portfolio/app/providers/theme/theme_provider.dart';
import 'package:erfan_portfolio/app/screens/about_screen.dart';
import 'package:erfan_portfolio/app/widgets/glow_wrapper.dart';
import 'package:erfan_portfolio/app/widgets/hero_widget.dart';
import 'package:erfan_portfolio/app/widgets/responsive_grid.dart';
import 'package:erfan_portfolio/app/widgets/screen_size_overlay.dart';
import 'package:erfan_portfolio/app/widgets/small_container.dart';
import 'package:erfan_portfolio/app/widgets/toggle_widget.dart';
import 'package:erfan_portfolio/app/widgets/yellow_button_widget.dart';
import 'package:erfan_portfolio/app/widgets/youtube_hero.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppColors colors = ref.watch(appColorsProvider);
    final ITextBuilder generateText = ref.watch(textProvider);
    final ITextProviderManager cardText = ref.watch(cardTextProvider);
    final INavigationManager navigationManager = ref.watch(
      navigationManagerProvider,
    );
    final ILinkManager linkProvider= ref.watch(linkManager);

    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        backgroundColor: colors.appbar,
        surfaceTintColor:
            Colors.transparent, // 🔒 Prevent unwanted Material blending
        shadowColor: Colors.transparent, // 🔒 Disable elevation shadows
        elevation: 0,
        // 🔒 Flatten it visually
        // these three lines above ensure no appbar color change when scrolling
        title: YellowButtonWidget(
          buttonText: 'Enter About',
          callback: () {
            navigationManager.navigateWithSlideFromLeft(
              context,
               ScreenSizeOverlay(screen: AboutScreen(), colors: colors),
            );
          },
          colors: colors,
          icon: Icon(Icons.arrow_forward_ios),
          iconPosition: IconPosition.right,
        ),
        titleTextStyle: TextStyle(fontSize: 20, color: colors.text),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ToggleWidget(colors: colors),
          ),
        ],
      ),
      body: ResponsiveGrid(
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
              callback: (){
                linkProvider.openExternalWebsite('https://pub.dev/packages/flutter_theme_changer_erfan');
              },
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
              callback: (){
                linkProvider.openExternalWebsite('https://pub.dev/packages/custom_time_picker_erfan');
              },
              text: generateText.buildUnorderedList(
                cardText.customTimePickerText(),
              ),
              imagePath: 'assets/time_picker.png',
              colors: colors,
            ),
          ),

          const SizedBox(width: double.infinity, height: 0),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlowWrapper(
                color: colors.links,
                intensity: 2,
                hoverIntensity: 25,
                hoverSpread: 2,
                radius: 25,
                child: YoutubeHeroWidget(colors: colors, callback: (){linkProvider.openExternalWebsite('https://pub.dev/packages/youtube_muxer_2025');},),
              ),

              const SizedBox(height: 18), // spacing between image and label

              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                ), // aligns with image left
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/book.png', height: 35),
                    const SizedBox(width: 8),
                    Text(
                      'Other projects',
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
              title: "WildlifeNL Internship",
              callback: (){linkProvider.openExternalWebsite('https://portfolio.drieam.app/s/GuxUr36X/FPTCxVwvhDcuy4WqByAjfnom/collection/140956/evidence/1023320/versions/latest');},
              text: generateText.buildUnorderedList(
                cardText.wildlifenlInternshipDescription(),
              ),
              imagePath: 'assets/wildrapport_loc.jpg',
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
              title: "Cyber Security",
              callback: (){
                linkProvider.openExternalWebsite('https://portfolio.drieam.app/s/GuxUr36X/C6ry4apR2z3iGtw6LqNsCA63/collection/140958/evidence/1023322/versions/latest');
              },
              text: generateText.buildUnorderedList(
                cardText.cyberSecurityText(),
              ),
              imagePath: 'assets/cyber.png',
              colors: colors,
            ),
          ),

          const SizedBox(width: double.infinity, height: 0),
        ],
      ),
    );
  }
}
