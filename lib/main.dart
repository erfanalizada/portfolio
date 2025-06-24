import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/app/providers/theme/theme_provider.dart';
import 'package:portfolio/app/screens/test_screen.dart';
import 'package:portfolio/app/widgets/screen_size_overlay.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeAsync = ref.watch(darkModeProvider);
    final getColors=ref.watch(appColorsProvider);

    return darkModeAsync.when(
      loading: () => const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (err, stack) => MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Error loading theme')),
        ),
      ),
      data: (isDarkmode) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: isDarkmode ? ThemeMode.dark : ThemeMode.light,
          home: ScreenSizeOverlay(screen: TestScreen(),colors: getColors,),
        );
      },
    );
  }
}

