import 'package:flutter/material.dart';

class GlowWrapper extends StatefulWidget {
  final Widget child;
  final Color color;
  final double intensity; // base blur
  final double radius;
  final double? hoverIntensity; // optional override
  final double? hoverSpread;    // optional override

  const GlowWrapper({
    super.key,
    required this.child,
    required this.color,
    this.intensity = 15,
    this.radius = 16,
    this.hoverIntensity,
    this.hoverSpread,
  });

  @override
  State<GlowWrapper> createState() => _GlowWrapperState();
}

class _GlowWrapperState extends State<GlowWrapper> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final double blur = _hovered
        ? (widget.hoverIntensity ?? widget.intensity * 2)
        : widget.intensity;

    final double spread = _hovered
        ? (widget.hoverSpread ?? widget.intensity * 0.4)
        : widget.intensity * 0.2;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.5),
              blurRadius: blur,
              spreadRadius: spread,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: widget.child,
        ),
      ),
    );
  }
}
