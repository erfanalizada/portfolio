import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/widgets/about_screen/about_info_card.dart';
import 'package:portfolio/app/widgets/about_screen/image_container_show.dart';
import 'package:portfolio/app/widgets/responsive_grid.dart';

class TestScreen extends ConsumerWidget{
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(appColorsProvider);

      return Scaffold(

     body: ImageContainerShow(colors: colors),

        // body: ResponsiveGrid(children: [
        //   Padding(padding: EdgeInsetsGeometry.all(50),
        //    child:AboutInfoCard(key: key,colors: colors)) ,]) 
      );
  }
  
}