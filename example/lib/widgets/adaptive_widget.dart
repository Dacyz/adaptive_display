import 'package:adaptive_display/adaptive_display.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class WidgetAdaptive extends StatelessWidget {
  const WidgetAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _WidgetAdaptive(),
    );
  }
}

class _WidgetAdaptive extends AdaptiveWidget {
  const _WidgetAdaptive();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Hello World!', style: textStyle));
  }

  @override
  Widget xs(BuildContext context, BoxConstraints constraints) {
    final text = 'XS! ${constraints.maxWidth} value';
    return Center(child: Text(text, style: textStyle));
  }

  @override
  Widget sm(BuildContext context, BoxConstraints constraints) {
    final text = 'SM! ${constraints.maxWidth} value';
    return Center(child: Text(text, style: textStyle));
  }

  @override
  Widget md(BuildContext context, BoxConstraints constraints) {
    final text = 'MD! ${constraints.maxWidth} value';
    return Center(child: Text(text, style: textStyle));
  }

  @override
  Widget lg(BuildContext context, BoxConstraints constraints) {
    final text = 'LG! ${constraints.maxWidth} value';
    return Center(child: Text(text, style: textStyle));
  }

  @override
  Widget xl(BuildContext context, BoxConstraints constraints) {
    final text = 'XL! ${constraints.maxWidth} value';
    return Center(child: Text(text, style: textStyle));
  }
}
