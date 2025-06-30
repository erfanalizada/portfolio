import 'package:flutter/material.dart';
import 'package:portfolio/app/models/color_model.dart';
import 'package:portfolio/app/screens/home_screen.dart';
import 'package:portfolio/app/widgets/screen_size_overlay.dart';

class LoaderScreen extends StatefulWidget {
  final AppColors colors;
  const LoaderScreen({super.key, required this.colors});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  final List<String> _criticalAssets = [
    'assets/selfie.png',
    'assets/github.png',
    'assets/flutter_logo.png',
    'assets/language_icons.png',
    'assets/frameworks.png',
  ];

  final List<String> _nonCriticalAssets = [
    'assets/theme_changer.png',
    'assets/time_picker.png',
    'assets/cyber.png',
    'assets/book.png',
    'assets/micro.png',
    'assets/target.png',
    'assets/wildrapport_loc.jpg',
    'assets/wildrapport_loc_details.jpg',
    'assets/wildrapport_home.jpg',
    'assets/wildrapport_rep.jpg',
    'assets/pub.png',
    'assets/barb.png',
    'assets/nature.png',
    'assets/reading_book.png',
    'assets/puzzle.png',
    'assets/man.png',
    'assets/youtube_pub.png',
    'assets/ai_for_society.jpg',
    'assets/pic.png',
    'assets/nl_logo.png',
    'assets/react_logo.png',
    'assets/community.png',
    'assets/playing_soccer.png',
    'assets/project.png',
    'assets/java_logo.png',
    'assets/personal_pic.png',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadCriticalAssets();
  }

  Future<void> _preloadCriticalAssets() async {
    for (final asset in _criticalAssets) {
      try {
        await precacheImage(AssetImage(asset), context);
      } catch (e) {
        debugPrint('Error preloading $asset: $e');
      }
    }

    // Short pause for smoother UX (optional)
    await Future.delayed(const Duration(milliseconds: 200));

    // Navigate to HomeScreen
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ScreenSizeOverlay(
            screen: const HomeScreen(),
            colors: widget.colors,
          ),
        ),
      );

      // Start lazy preload after first frame of HomeScreen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _lazyPreloadAssets();
      });
    }
  }

  void _lazyPreloadAssets() {
    for (final asset in _nonCriticalAssets) {
      precacheImage(AssetImage(asset), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Replace with Lottie if needed
      ),
    );
  }
}
