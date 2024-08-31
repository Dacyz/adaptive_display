import 'package:adaptive_display/core/adaptive.dart';
import 'package:adaptive_display/src/widget/adaptive_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveStateLessWidget extends Widget {
  /// Initializes [key] for subclasses.
  const AdaptiveStateLessWidget({super.key});

  @override
  AdaptiveLessElement createElement() => AdaptiveLessElement(this);

  /// {@macro flutter.widgets.Widget.build}
  ///
  /// Called when the widget is inserted into the tree.
  ///
  /// Override this method to handle the build process for this widget.
  ///
  /// The [framework] argument is the [StatelessElement] object for this
  /// widget. The [child] argument is the child widget, if any.
  ///
  /// Returns the widget itself.
  ///
  /// Default widget build of [AdaptiveStateLessWidget]
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

  /// The xs method is called when the screen size is XS or larger.
  /// By default, it calls the build method.
  @protected
  Widget xs(BuildContext context) => build(context);

  /// The sm method is called when the screen size is SM or larger.
  /// By default, it calls the xs method.
  @protected
  Widget sm(BuildContext context) => xs(context);

  /// The md method is called when the screen size is MD or larger.
  /// By default, it calls the sm method.
  @protected
  Widget md(BuildContext context) => sm(context);

  /// The lg method is called when the screen size is LG or larger.
  /// By default, it calls the md method.
  @protected
  Widget lg(BuildContext context) => md(context);

  /// The xl method is called when the screen size is XL or larger.
  /// By default, it calls the lg method.
  @protected
  Widget xl(BuildContext context) => lg(context);

  /// The xxl method is called when the screen size is XXL or larger.
  /// By default, it calls the xl method.
  @protected
  Widget xxl(BuildContext context) => xl(context);
}
