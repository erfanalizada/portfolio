import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;

  const ResponsiveGrid({
    Key? key,
    required this.children,
    this.spacing = 16,
    this.runSpacing = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: spacing,
          runSpacing: runSpacing,
          children: children,
        ),
      ),
    );
  }
}
