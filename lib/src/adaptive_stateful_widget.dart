import 'package:adaptive_display/adaptive_display.dart';
import 'package:flutter/widgets.dart';

@optionalTypeArgs
abstract class AdaptiveWrapState<T extends StatefulWidget> extends State<T> {
  @protected
  @override
  Widget build(BuildContext context) => adaptive;

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

  Widget get adaptive => LayoutBuilder(builder: _match);

  @protected
  Widget xs(BuildContext context);

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
