import 'package:adaptive_display/adaptive_display.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class StatefulAdaptive extends StatefulWidget {
  const StatefulAdaptive({super.key});

  @override
  State<StatefulAdaptive> createState() => _StatefulAdaptiveState();
}

class _StatefulAdaptiveState extends AdaptiveWrapState<StatefulAdaptive> {
  String someValue = 'Click below to get your adaptive value!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(16),
          child: adaptive, // you should call adaptive here
        ),
      ),
    );
  }

  @override
  Widget xs(BuildContext context) {
    return _textAndButton(
        '$someValue!', () => setState(() => someValue = 'XS'));
  }

  @override
  Widget sm(BuildContext context) {
    return _textAndButton(
        '$someValue!', () => setState(() => someValue = 'SM'));
  }

  @override
  Widget md(BuildContext context) {
    return _textAndButton(
        '$someValue!', () => setState(() => someValue = 'MD'));
  }

  @override
  Widget lg(BuildContext context) {
    return _textAndButton(
        '$someValue!', () => setState(() => someValue = 'LG'));
  }

  @override
  Widget xl(BuildContext context) {
    return _textAndButton(
        '$someValue!', () => setState(() => someValue = 'XL'));
  }

  Widget _textAndButton(String text, void Function() onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: textStyle),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: onTap,
          child: const Text('Click me!'),
        ),
      ],
    );
  }
}
