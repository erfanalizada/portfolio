import 'package:erfan_portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:erfan_portfolio/app/interfaces/i_text_builder.dart';
import 'package:erfan_portfolio/app/interfaces/i_text_provider_manager.dart';
import 'package:erfan_portfolio/app/models/color_model.dart';
import 'package:erfan_portfolio/app/providers/managers/manager_providers.dart';
import 'package:erfan_portfolio/app/widgets/yellow_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class YoutubeHeroWidget extends ConsumerWidget {
  final AppColors colors;
  const YoutubeHeroWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ITextProviderManager providedText = ref.watch(cardTextProvider);
    final ITextBuilder textBuilder = ref.watch(textProvider);

    return SizedBox(
      width: 700,
      height: 275,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: colors.border, width: 2),
        ),
        child: Row(
          children: [
            // Left: Wider Image
            Container(
              width: 380, // Increased image width
              decoration: BoxDecoration(
                border: Border.all(color: colors.border, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/youtube_pub.png',
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12), // Slightly smaller gap

            // Right: Text + Button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Scrollable text block
                    Expanded(
                      child: SingleChildScrollView(
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
                    ),

                    // Button aligned bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: YellowButtonWidget(
                        buttonText: "Read more",
                        callback: () {
                          // Add action here
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        iconPosition: IconPosition.right,
                        colors: colors,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
