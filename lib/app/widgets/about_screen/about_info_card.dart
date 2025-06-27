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

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
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

                    // Image Row
                    Container(
                      width: imageWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset('assets/selfie.png', fit: BoxFit.fill),
                    ),

                    const SizedBox(height: 20),

                    // Languages Spoken
                    Text(
                      textBuilder.buildUnorderedList(
                        cardtextProvider.languagesSpoken(),
                      ),
                      style: TextStyle(
                        color: colors.title,
                        fontSize: 14,
                        fontFamily: 'KohSantepheap',
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // Currently Learning
                    Text(
                      'Currently learning\nArabic as well',
                      style: TextStyle(
                        color: colors.text,
                        fontSize: 16,
                        fontFamily: 'KohSantepheap',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    SizedBox(width: 20), // spacing between columns
                  ],
                ),
              ),

              





            ],































          );
        },
      ),
    );
  }
}
