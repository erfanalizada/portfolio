import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/widgets/glow_wrapper.dart';
import 'package:portfolio/app/widgets/small_container.dart';
import 'package:portfolio/app/widgets/toggle_widget.dart';
import 'package:portfolio/app/widgets/hero_widget.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppColors getColors = ref.watch(appColorsProvider);
    final ITextBuilder generateText = ref.watch(textProvider);

    final Map<String, List<String>> techStack = {
      'Technologies that has been used': [
        'Flutter using dart',
        'Riverpod flutter package',
        'Firebase realtime database',
        'Dart which belongs to flutter',
      ],
    };

    return Scaffold(
      backgroundColor: getColors.primary,
      appBar: AppBar(
        backgroundColor: getColors.appbar,
        title: const Text("Test Screen"),
        titleTextStyle: TextStyle(fontSize: 20, color: getColors.text),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ToggleWidget(colors: getColors),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 👇 Changed breakpoint from 800 to 1050
          final bool isSmallScreen = constraints.maxWidth < 1050;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Center(
              child: Flex(
                direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: isSmallScreen ? double.infinity : null,
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: GlowWrapper(
                      color: getColors.links,
                      intensity: 2,
                      hoverIntensity: 25,
                      hoverSpread: 2,
                      radius: 25,
                      child: HeroWidget(colors: getColors),
                    ),
                  ),
                  SizedBox(
                    width: isSmallScreen ? 0 : 40,
                    height: isSmallScreen ? 40 : 0,
                  ),
                  Container(
                    width: isSmallScreen ? double.infinity : null,
                    padding: const EdgeInsets.all(8),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: GlowWrapper(
                      color: getColors.links,
                      intensity: 2,
                      hoverIntensity: 25,
                      hoverSpread: 2,
                      radius: 25,
                      child: SmallContainer(
                        title: "Technologies Used",
                        text: generateText.buildUnorderedList(techStack),
                        imagePath: 'assets/pic.png',
                        colors: getColors,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
