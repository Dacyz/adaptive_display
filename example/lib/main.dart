import 'package:adaptive_display/adaptive_display.dart';
import 'package:flutter/material.dart';
import 'package:widget_adaptive/widgets/adaptive_colorful.dart';
import 'package:widget_adaptive/widgets/adaptive_stateful.dart';
import 'package:widget_adaptive/widgets/adaptive_stateless.dart';
import 'package:widget_adaptive/widgets/adaptive_widget.dart';
import 'package:widget_adaptive/widgets/adaptive_wrap.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Adaptive',
      color: Colors.black,
      builder: (context, child) => child!,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes,
    );
  }
}

class SelectorPage extends AdaptiveWrapWidget {
  const SelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(32),
          children: [
            ElevatedButton(
              onPressed: () => _goToWidgetAdaptive(context),
              child: const Text('Widget Adaptive'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _goToWidgetWrap(context),
              child: const Text('Widget Adaptive Wrap'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _goToWidgetStateless(context),
              child: const Text('Widget Stateless'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _goToWidgetStateful(context),
              child: const Text('Widget Stateful'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _goToWidgetColorful(context),
              child: const Text('Widget Colorful'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget md(BuildContext context, BoxConstraints constraints) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(32),
                children: [
                  ElevatedButton(
                    onPressed: () => _goToWidgetAdaptive(context),
                    child: const Text('Widget Adaptive'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _goToWidgetWrap(context),
                    child: const Text('Widget Adaptive Wrap'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _goToWidgetStateless(context),
                    child: const Text('Widget Stateless'),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(32),
                children: [
                  ElevatedButton(
                    onPressed: () => _goToWidgetStateful(context),
                    child: const Text('Widget Stateful'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _goToWidgetColorful(context),
                    child: const Text('Widget Colorful'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget xs(BuildContext context, BoxConstraints constraints) {
    // TODO: implement xs
    throw UnimplementedError();
  }
}

void _goToWidgetAdaptive(BuildContext context) {
  Navigator.pushNamed(context, '/widget_adaptive');
}

void _goToWidgetStateless(BuildContext context) {
  Navigator.pushNamed(context, '/widget_stateless');
}

void _goToWidgetStateful(BuildContext context) {
  Navigator.pushNamed(context, '/widget_stateful');
}

void _goToWidgetWrap(BuildContext context) {
  Navigator.pushNamed(context, '/widget_wrap');
}

void _goToWidgetColorful(BuildContext context) {
  Navigator.pushNamed(context, '/widget_colorful');
}

final routes = {
  '/': (context) => const SelectorPage(),
  '/widget_adaptive': (context) => const WidgetAdaptive(),
  '/widget_wrap': (context) => const WidgetWrapAdaptive(),
  '/widget_stateless': (context) => const StateLessAdaptive(),
  '/widget_stateful': (context) => const StatefulAdaptive(),
  '/widget_colorful': (context) => const ColorfulAdaptive(),
};
