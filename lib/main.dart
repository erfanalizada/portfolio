import 'package:erfan_portfolio/app/providers/theme/theme_provider.dart';
import 'package:erfan_portfolio/app/screens/loader_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
          title: "Erfan Alizada's portfolio",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: isDarkmode ? ThemeMode.dark : ThemeMode.light,
          home: LoaderScreen(colors: getColors),
          

        );
      },
    );
  }
}

