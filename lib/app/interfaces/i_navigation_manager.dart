import 'package:flutter/material.dart';

abstract class INavigationManager {
  void navigateWithFadeSlide(BuildContext context, Widget destination);
  void navigateWithSlideFromRight(BuildContext context, Widget destination);
  void navigateWithSlideFromLeft(BuildContext context, Widget destination); 
  void navigateWithPushDown(BuildContext context, Widget destination);
  void navigateWithCenterFade(BuildContext context, Widget destination); 
}