import 'package:adaptive_display/adaptive_display.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w900,
  color: Colors.black,
);

const colors = [
  Colors.amber,
  Colors.orangeAccent,
  Colors.orange,
  Colors.deepOrangeAccent,
  Colors.deepOrange,
];

class ColorfulAdaptive extends AdaptiveWrapWidget {
  const ColorfulAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: adaptive);
  }

  double value(double x1, double x2, double x3) =>
      ((x3 - x2) / (x1 - x2)).clamp(0.0, 1.0);

  Color interpolatedColor(Color start, Color end, double t) {
    return Color.lerp(start, end, t) ?? colors.first;
  }

  @override
  Widget xs(BuildContext context, BoxConstraints constraints) {
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      color: colors.first,
      alignment: Alignment.center,
      child: const Text('XS!', style: textStyle),
    );
  }

  @override
  Widget sm(BuildContext context, BoxConstraints constraints) {
    final intensity = value(settings.sm, settings.xs, constraints.maxWidth);
    final color = interpolatedColor(colors.first, colors[1], intensity);
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      color: color,
      alignment: Alignment.center,
      child: Container(
        height: constraints.maxHeight,
        width: settings.xs,
        color: colors.first,
        alignment: Alignment.center,
        child: const Text('SM!', style: textStyle),
      ),
    );
  }

  @override
  Widget md(BuildContext context, BoxConstraints constraints) {
    final intensity = value(settings.md, settings.sm, constraints.maxWidth);
    final color = interpolatedColor(colors[1], colors[2], intensity);
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      color: color,
      alignment: Alignment.center,
      child: Container(
        height: constraints.maxHeight,
        width: settings.sm,
        color: colors[1],
        alignment: Alignment.center,
        child: Container(
          height: constraints.maxHeight,
          width: settings.xs,
          color: colors.first,
          alignment: Alignment.center,
          child: const Text('MD!', style: textStyle),
        ),
      ),
    );
  }

  @override
  Widget lg(BuildContext context, BoxConstraints constraints) {
    final colorValue = value(settings.lg, settings.md, constraints.maxWidth);
    final color = interpolatedColor(colors[2], colors[3], colorValue);
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      color: color,
      alignment: Alignment.center,
      child: Container(
        height: constraints.maxHeight,
        width: settings.md,
        color: colors[2],
        alignment: Alignment.center,
        child: Container(
          height: constraints.maxHeight,
          width: settings.sm,
          color: colors[1],
          alignment: Alignment.center,
          child: Container(
            height: constraints.maxHeight,
            width: settings.xs,
            color: colors.first,
            alignment: Alignment.center,
            child: const Text('LG!', style: textStyle),
          ),
        ),
      ),
    );
  }

  @override
  Widget xl(BuildContext context, BoxConstraints constraints) {
    final colorValue = value(settings.xl, settings.lg, constraints.maxWidth);
    final color = interpolatedColor(colors[3], colors[4], colorValue);
    return Container(
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      color: color,
      alignment: Alignment.center,
      child: Container(
        height: constraints.maxHeight,
        width: settings.lg,
        color: colors[3],
        alignment: Alignment.center,
        child: Container(
          height: constraints.maxHeight,
          width: settings.md,
          color: colors[2],
          alignment: Alignment.center,
          child: Container(
            height: constraints.maxHeight,
            width: settings.sm,
            color: colors[1],
            alignment: Alignment.center,
            child: Container(
              height: constraints.maxHeight,
              width: settings.xs,
              color: colors.first,
              alignment: Alignment.center,
              child: const Text('XL!', style: textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
