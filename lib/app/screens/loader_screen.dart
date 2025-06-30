import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    'assets/resize_animation.json',
    'assets/loader.json',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadCriticalAssets();
  }

  Future<void> _preloadCriticalAssets() async {
    final start = DateTime.now();

    for (final asset in _criticalAssets) {
      try {
        await precacheImage(AssetImage(asset), context);
      } catch (e) {
        debugPrint('Error preloading $asset: $e');
      }
    }

    final elapsed = DateTime.now().difference(start);
    if (elapsed < const Duration(seconds: 2)) {
      await Future.delayed(const Duration(seconds: 2) - elapsed);
    }

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

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _lazyPreloadAssets();
      });
    }
  }

  void _lazyPreloadAssets() {
    for (final asset in _nonCriticalAssets) {
      if (asset.endsWith('.png') || asset.endsWith('.jpg')) {
        precacheImage(AssetImage(asset), context);
      } else if (asset.endsWith('.json')) {
        AssetLottie(asset).load().catchError((e) {
          debugPrint('Error preloading Lottie $asset: $e');
          return null;
        });
      }
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: widget.colors.secondary,
    body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset(
            'assets/loader.json',
            width: 600,
            height: 600,
            fit: BoxFit.contain,
          ),
          Positioned(
            top: 80, // Adjust this value as needed
            child: _AnimatedWelcomeText(colors: widget.colors),
          ),
        ],
      ),
    ),
  );
}

}

class _AnimatedWelcomeText extends StatefulWidget {
  final AppColors colors;
  const _AnimatedWelcomeText({required this.colors});

  @override
  State<_AnimatedWelcomeText> createState() => _AnimatedWelcomeTextState();
}

class _AnimatedWelcomeTextState extends State<_AnimatedWelcomeText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scale = Tween<double>(begin: 0.8, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Opacity(
        opacity: _opacity.value,
        child: Transform.scale(
          scale: _scale.value,
         child: Text(
  'Welcome',
  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        fontFamily: 'KohSantepheap',
        color: Colors.white, // ✅ Contrast against secondary background
      ),
),

        ),
      ),
    );
  }
}
