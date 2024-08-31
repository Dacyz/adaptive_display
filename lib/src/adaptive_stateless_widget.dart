import 'package:adaptive_display/core/adaptive.dart';
import 'package:adaptive_display/src/widget/adaptive_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveStateLessWidget extends Widget {
  /// Initializes [key] for subclasses.
  const AdaptiveStateLessWidget({super.key});

  @override
  AdaptiveLessElement createElement() => AdaptiveLessElement(this);

  @protected
  Widget build(BuildContext context);

  /// Evaluates the widget based on the [BoxConstraints].
  ///
  /// Returns the widget that matches the current [BoxConstraints]
  /// (Extra Small, Small, Medium, Large, Extra Large, or XXL).
  @widgetFactory
  Widget _match(BuildContext context, BoxConstraints constraints) {
    if (constraints.isXS) {
      return xs(context);
    } else if (constraints.isSM) {
      return sm(context);
    } else if (constraints.isMD) {
      return md(context);
    } else if (constraints.isLG) {
      return lg(context);
    } else if (constraints.isXL) {
      return xl(context);
    } else {
      return xxl(context);
    }
  }

  @nonVirtual
  Widget get adaptive => LayoutBuilder(builder: _match);

  @protected
  Widget xs(BuildContext context) => build(context);

  @protected
  Widget sm(BuildContext context) => xs(context);

  @protected
  Widget md(BuildContext context) => sm(context);

  @protected
  Widget lg(BuildContext context) => md(context);

  @protected
  Widget xl(BuildContext context) => lg(context);

  @protected
  Widget xxl(BuildContext context) => xl(context);
}
