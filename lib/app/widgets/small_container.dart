import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/providers/managers/manager_providers.dart';

class SmallContainer extends ConsumerWidget {
  final AppColors colors;
  final Map<String, List<String>> data;
  final String image;
  final Size size;

const SmallContainer({
  super.key,
  required this.colors,
  required this.data,
  required this.image,
  required this.size, // new
});


  @override
Widget build(BuildContext context, WidgetRef ref) {
  final textBuilderManager = ref.watch(textProvider);
  final String result = textBuilderManager.buildUnorderedList(data);

  return SizedBox(
    width: size.width,
    height: size.height,
    child: Container(
      color: colors.secondary,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🖼️ Image: 40% height
          SizedBox(
            height: size.height * 0.2,
            child: image.startsWith('http')
                ? Image.network(image, fit: BoxFit.contain)
                : Image.asset(image, fit: BoxFit.contain),
          ),

          const SizedBox(height: 16),

          // 📝 Text area: 40% height
          SizedBox(
            height: size.height * 0.4,
            child: SingleChildScrollView(
              child: Text(
                result,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}