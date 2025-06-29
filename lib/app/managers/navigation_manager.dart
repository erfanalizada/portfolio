import 'package:flutter/material.dart';
import 'package:portfolio/app/interfaces/i_navigation_manager.dart';

class NavigationManager implements INavigationManager{


  
@override
void navigateWithFadeSlide(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => destination,
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnim = Tween<Offset>(
          begin: const Offset(0.0, 0.1),
          end: Offset.zero,
        ).animate(animation);

        final fadeAnim = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(animation);

        return FadeTransition(
          opacity: fadeAnim,
          child: SlideTransition(
            position: offsetAnim,
            child: child,
          ),
        );
      },
    ),
  );
}

@override
void navigateWithSlideFromRight(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => destination,
      transitionsBuilder: (_, animation, __, child) {
        final slideAnim = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutQuart,
        ));

        return SlideTransition(
          position: slideAnim,
          child: child,
        );
      },
    ),
  );
}

@override
void navigateWithSlideFromLeft(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, __, ___) => destination,
      transitionsBuilder: (_, animation, __, child) {
        final slideAnim = Tween<Offset>(
          begin: const Offset(-1.0, 0.0), // From left
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutQuart,
        ));

        return SlideTransition(
          position: slideAnim,
          child: child,
        );
      },
    ),
  );
}

@override
void navigateWithPushDown(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (_, __, ___) => destination,
      transitionsBuilder: (context, animation, __, child) {
        final slideIn = Tween<Offset>(
          begin: const Offset(0.0, -1.0), // from top
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ));

        return SlideTransition(
          position: slideIn,
          child: child,
        );
      },
    ),
  );
}

@override
void navigateWithCenterFade(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (_, __, ___) => destination,
      transitionsBuilder: (_, animation, __, child) {
        final fadeAnim = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );

        return FadeTransition(
          opacity: fadeAnim,
          child: Align(
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
    ),
  );
}




}