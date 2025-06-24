import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/enums/yellow_button_icon_position_enum.dart';
import 'package:portfolio/app/interfaces/i_text_builder.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';
import 'package:portfolio/app/widgets/yellow_button_widget.dart';

class HeroWidget extends ConsumerWidget {
  final AppColors colors;
  const HeroWidget({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, List<String>> textContent = {
      'Programming languages mastering:': [
        'Flutter (Mobile App development)',
        'React (Web App development)',
        'Java for setting API',
      ],
    };
    final ITextBuilder generateText = ref.watch(textProvider);

    return Container(
      width: 700,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: colors.border, width: 2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final imageWidth = constraints.maxWidth * 0.4;
          final contentWidth = constraints.maxWidth - imageWidth - 8;

          return SingleChildScrollView(
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Column (Image)
                  Container(
                    width: imageWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        'assets/personal_pic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),

                  // Second Column (Content)
                  SizedBox(
                    width: contentWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + Logo
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Hi, I'm \nErfan Alizada ",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'KohSantepheap',
                                        color: colors.title,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4.0, right: 16.0),
                                    child: Image.asset(
                                      'assets/nl_logo.png',
                                      height: 45,
                                      width: 45,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Container(
                                height: 2,
                                color: colors.button,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 30),

                        Text(
                          'Software Engineer specializing in Mobile & Web App Development and API’s',
                          style: TextStyle(
                            color: colors.text,
                            fontSize: 17,
                            fontFamily: 'KohSantepheap',
                          ),
                        ),

                        SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            generateText.buildUnorderedList(textContent),
                            style: TextStyle(
                              fontSize: 14,
                              color: colors.text,
                              fontFamily: 'KohSantepheap',
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'This portfolio is built with Flutter',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: colors.title,
                                  fontFamily: 'KohSantepheap',
                                ),
                              ),
                              SizedBox(height: 80),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/flutter_logo.png', height: 35),
                                      SizedBox(width: 16),
                                      Image.asset('assets/react_logo.png', height: 35),
                                      SizedBox(width: 16),
                                      Image.asset('assets/java_logo.png', height: 35),
                                    ],
                                  ),
                              
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: YellowButtonWidget(
                                      buttonText: "Read more",
                                      callback: () {},
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      iconPosition: IconPosition.right,
                                      colors: colors,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
