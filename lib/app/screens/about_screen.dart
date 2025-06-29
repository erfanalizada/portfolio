import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:portfolio/app/interfaces/i_navigation_manager.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/screens/home_screen.dart';
import 'package:portfolio/app/widgets/about_screen/about_info_card.dart';
import 'package:portfolio/app/widgets/about_screen/image_container_show.dart';
import 'package:portfolio/app/widgets/about_screen/skills_box_widget.dart';
import 'package:portfolio/app/widgets/glow_wrapper.dart';
import 'package:portfolio/app/widgets/responsive_grid.dart';
import 'package:portfolio/app/widgets/screen_size_overlay.dart';
import 'package:portfolio/app/widgets/small_container.dart';
import 'package:portfolio/app/widgets/toggle_widget.dart';
import 'package:portfolio/app/widgets/yellow_button_widget.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppColors colors = ref.watch(appColorsProvider);
    final ITextBuilder generateText = ref.watch(textProvider);
    final ITextProviderManager cardText = ref.watch(cardTextProvider);
    final INavigationManager navigationManager= ref.watch(navigationManagerProvider);
    final List<String> rightImages = ['assets/frameworks.png'];
    final List<String> leftImages = ['assets/language_icons.png'];

    return Scaffold(
      backgroundColor: colors.primary,
      appBar: AppBar(
        backgroundColor: colors.appbar,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: YellowButtonWidget(
          buttonText: 'Enter Home',
          callback: () {
            navigationManager.navigateWithSlideFromLeft(context,  ScreenSizeOverlay(screen:  HomeScreen(),colors: colors) );
          },
          colors: colors,
          icon: const Icon(Icons.arrow_forward_ios),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlowWrapper(
                color: colors.links,
                intensity: 2,
                hoverIntensity: 25,
                hoverSpread: 2,
                radius: 25,
                child: AboutInfoCard(colors: colors),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/puzzle.png', height: 35),
                    const SizedBox(width: 8),
                    Text(
                      'Hobbies & Interests',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageContainerShow(colors: colors),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/man.png', height: 35),
                    const SizedBox(width: 8),
                    Text(
                      'Skills developed during software courses',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkillsBoxWidget(
                leftTitle:
                    generateText.buildUnorderedList(cardText.programmingLanguageSkills()),
                rightTitle:
                    generateText.buildUnorderedList(cardText.otherSkills()),
                rightImageUrls: rightImages,
                leftImageUrls: leftImages,
                colors: colors,
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/book.png', height: 35),
                    const SizedBox(width: 8),
                    Text(
                      'Other Courses',
                      style: TextStyle(
                        color: colors.title,
                        fontSize: 22,
                        fontFamily: 'KohSantepheap',
                      ),
                    ),
                  ],
                ),
              ),
            ],//
          ),
          const SizedBox(width: double.infinity, height: 0),
          GlowWrapper(
            color: colors.links,
            intensity: 2,
            hoverIntensity: 25,
            hoverSpread: 2,
            radius: 25,
            child: SmallContainer(
              title: "Ai for Society",
              text: generateText.buildUnorderedList(cardText.aiForSocietyText()),
              imagePath: 'assets/ai_for_society.jpg',
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
              text: generateText.buildUnorderedList(cardText.cyberSecurityText()),
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
