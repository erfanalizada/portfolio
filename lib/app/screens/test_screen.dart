import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/widgets/toggle_widget.dart';
import 'package:portfolio/app/widgets/small_container.dart'; // Import your widget

class TestScreen extends ConsumerWidget {
  final AppColors colors;
  const TestScreen({super.key, required this.colors});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Screen"),
        titleTextStyle: TextStyle(fontSize: 20, color: colors.text),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ToggleWidget(colors: colors),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate width and height based on layout constraints
          final width = constraints.maxWidth * 0.6;
          final height = constraints.maxHeight *0.6; // because of AspectRatio 1.5

          return SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: width,
                height: height,
                child: SmallContainer(
                  colors: colors,
                  data: {
                    "Technologies that has been adapted": ["Flutter", "Riverpod", "Firebase", "Dart"]
                  },
                  image: 'assets/images/flutter.png', // or a network image
                  size: Size(width, height),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
