import 'package:adaptive_display/adaptive_display.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class StateLessAdaptive extends StatelessWidget {
  const StateLessAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _StateLessAdaptive(),
    );
  }
}

class _StateLessAdaptive extends AdaptiveStateLessWidget {
  const _StateLessAdaptive();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Hello World!', style: textStyle));
  }

  @override
  Widget xs(BuildContext context) {
    return const Center(child: Text('XS!', style: textStyle));
  }

  @override
  Widget sm(BuildContext context) {
    return const Center(child: Text('SM!', style: textStyle));
  }

  @override
  Widget md(BuildContext context) {
    return const Center(child: Text('MD!', style: textStyle));
  }

  @override
  Widget lg(BuildContext context) {
    return const Center(child: Text('LG!', style: textStyle));
  }

  @override
  Widget xl(BuildContext context) {
    return const Center(child: Text('XL!', style: textStyle));
  }
}
