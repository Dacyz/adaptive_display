import 'package:adaptive_display/core/adaptive.dart';
import 'package:adaptive_display/src/widget/adaptive_element.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveWrapWidget extends Widget {
  /// Initializes [key] for subclasses.
  const AdaptiveWrapWidget({super.key});

  @override
  AdaptiveWrapElement createElement() => AdaptiveWrapElement(this);

  Widget build(BuildContext context) => adaptive;

  /// Evaluates the widget based on the [BoxConstraints].
  ///
  /// Returns the widget that matches the current [BoxConstraints]
  /// (Extra Small, Small, Medium, Large, Extra Large, or XXL).
  Widget _match(BuildContext context, BoxConstraints constraints) {
    if (constraints.isXS) {
      return xs(context, constraints);
    } else if (constraints.isSM) {
      return sm(context, constraints);
    } else if (constraints.isMD) {
      return md(context, constraints);
    } else if (constraints.isLG) {
      return lg(context, constraints);
    } else if (constraints.isXL) {
      return xl(context, constraints);
    } else {
      return xxl(context, constraints);
    }
  }

  Widget get adaptive => LayoutBuilder(builder: _match);

  @protected
  Widget xs(BuildContext context, BoxConstraints constraints);

  @protected
  Widget sm(BuildContext context, BoxConstraints constraints) => xs(context, constraints);

  @protected
  Widget md(BuildContext context, BoxConstraints constraints) => sm(context, constraints);

  @protected
  Widget lg(BuildContext context, BoxConstraints constraints) => md(context, constraints);

  @protected
  Widget xl(BuildContext context, BoxConstraints constraints) => lg(context, constraints);

  @protected
  Widget xxl(BuildContext context, BoxConstraints constraints) => xl(context, constraints);
}
