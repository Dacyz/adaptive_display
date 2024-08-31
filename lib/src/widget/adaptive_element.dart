import 'package:adaptive_display/src/adaptive_stateless_widget.dart';
import 'package:adaptive_display/src/adaptive_widget.dart';
import 'package:adaptive_display/src/adaptive_wrap_widget.dart';
import 'package:flutter/widgets.dart';

/// An [Element] that uses a [AdaptiveLessElement] as its configuration.
class AdaptiveLessElement extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  AdaptiveLessElement(AdaptiveStateLessWidget super.widget);

  @override
  Widget build() => (widget as AdaptiveStateLessWidget).adaptive;

  @override
  void update(AdaptiveStateLessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}

/// An [Element] that uses a [AdaptiveElement] as its configuration.
class AdaptiveElement extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  AdaptiveElement(AdaptiveWidget super.widget);

  @override
  Widget build() => (widget as AdaptiveWidget).adaptive;

  @override
  void update(AdaptiveWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}

/// An [Element] that uses a [AdaptiveLessElement] as its configuration.
class AdaptiveWrapElement extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  AdaptiveWrapElement(AdaptiveWrapWidget super.widget);

  @override
  Widget build() => (widget as AdaptiveWrapWidget).build(this);

  @override
  void update(AdaptiveWrapWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}
