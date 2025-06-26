import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';
import 'package:portfolio/app/widgets/yellow_button_widget.dart';

class YoutubeHeroWidget extends ConsumerWidget {
  final AppColors colors;
  const YoutubeHeroWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ITextProviderManager providedText = ref.watch(cardTextProvider);
    final ITextBuilder textBuilder = ref.watch(textProvider);

    return Center(
      child: SizedBox(
        width: 700,
        height: 275, // 75px taller as requested
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: colors.border, width: 2),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.border, width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/youtube_pub.png',
                    width: 400,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Left: Plugin Screenshot
              const SizedBox(width: 16),

              // Right: Text and Button
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                textBuilder.buildUnorderedList(
                                  providedText.youtubeDonwloaderText(),
                                ),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: colors.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),

                      // Right-aligned Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          YellowButtonWidget(
                            buttonText: "Read more",
                            callback: () {
                              // Add navigation or action here
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconPosition: IconPosition.right,
                            colors: colors,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
