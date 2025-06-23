import 'package:flutter/material.dart';

class HoverEffectWrapper extends StatefulWidget {
  final Widget child;
  final double scaleFactor;
  final Duration duration;

  const HoverEffectWrapper({
    super.key,
    required this.child,
    this.scaleFactor = 1.03,
    this.duration = const Duration(milliseconds: 150),
  });

  @override
  State<HoverEffectWrapper> createState() => _HoverEffectWrapperState();
}

class _HoverEffectWrapperState extends State<HoverEffectWrapper> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: widget.duration,
        transform: Matrix4.identity()
          ..scale(_isHovered ? widget.scaleFactor : 1.0),
        child: widget.child,
      ),
    );
  }
}
