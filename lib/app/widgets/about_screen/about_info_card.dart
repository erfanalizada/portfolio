import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';

class AboutInfoCard extends ConsumerWidget {
  final AppColors colors;
  const AboutInfoCard({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ITextProviderManager cardtextProvider = ref.watch(cardTextProvider);
    final ITextBuilder textBuilder = ref.watch(textProvider);

    return Container(
      width: 700,
      height: 520,
      decoration: BoxDecoration(
        border: Border.all(color: colors.border, width: 2),
        borderRadius: BorderRadius.circular(25),
        color: colors.secondary,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageWidth = constraints.maxWidth * 0.2;
          final imageHeight = constraints.maxHeight * 0.4;

          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  children: [
                    Text(
                      "About me",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KohSantepheap',
                        color: colors.title,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'assets/nl_logo.png',
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // MAIN CONTENT
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LEFT COLUMN
                        Flexible(
                          child: buildColumnContent(
                            imageWidth,
                            imageHeight,
                            textBuilder,
                            cardtextProvider,
                          ),
                        ),

                        const SizedBox(width: 20),

                        // RIGHT COLUMN
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // CURIOUS ENGINEER
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8,
                                children: [
                                  Text(
                                    "Curious Engineer",
                                    style: TextStyle(
                                      color: colors.title,
                                      fontSize: 25,
                                      fontFamily: 'KohSantepheap',
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/micro.png',
                                    height: 45,
                                    width: 45,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // PARAGRAPH 1
                              SizedBox(
                                width: 450,
                                child: Text(
                                  'A curious problem-solver & Flutter enthusiast who loves crafting seamless applications regardless of its use case or difficulty. Always open to learn and expand my knowledge.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: colors.text,
                                    fontFamily: 'KohSantepheap',
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              // MY MISSION
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 8,
                                children: [
                                  Text(
                                    "My Mission",
                                    style: TextStyle(
                                      color: colors.title,
                                      fontSize: 25,
                                      fontFamily: 'KohSantepheap',
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/target.png',
                                    height: 45,
                                    width: 45,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // PARAGRAPH 2
                              SizedBox(
                                width: 450,
                                child: Text(
                                  'I love working on projects that enrich people’s lives and inspire them to engage actively with themselves and their communities, encouraging them to be creators rather than just consumers.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: colors.text,
                                    fontFamily: 'KohSantepheap',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildColumnContent(
    double imageWidth,
    double imageHeight,
    ITextBuilder textBuilder,
    ITextProviderManager cardtextProvider,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // IMAGE
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          child: Image.asset('assets/selfie.png', fit: BoxFit.fill),
        ),
        const SizedBox(height: 20),

        // LANGUAGES
        Text(
          textBuilder.buildUnorderedList(cardtextProvider.languagesSpoken()),
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: colors.title,
            fontSize: 14,
            fontFamily: 'KohSantepheap',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),

        // CURRENTLY LEARNING
        Text(
          'Currently learning\nArabic as well',
          softWrap: true,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: colors.text,
            fontSize: 16,
            fontFamily: 'KohSantepheap',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
