import 'package:adaptive_display/core/adaptive.dart';
import 'package:adaptive_display/src/widget/adaptive_element.dart';
import 'package:flutter/widgets.dart';

abstract class AdaptiveWrapWidget extends Widget {
  /// Initializes [key] for subclasses.
  const AdaptiveWrapWidget({super.key});

  @override
  AdaptiveWrapElement createElement() => AdaptiveWrapElement(this);

  /// By making the build method capable of wrapping the adaptive logic,
  /// the xs method becomes mandatory and is the first method to be called.
  Widget build(BuildContext context) => adaptive;

  AdaptiveSettings get settings => Adaptive.settings;

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

  /// The xs method is the first one to be called, and it is the default
  /// method that is used when the screen size is XS.
  ///
  /// Default widget build of [AdaptiveWrapWidget]
  @protected
  Widget xs(BuildContext context, BoxConstraints constraints);

  /// The sm method is called when the screen size is SM or larger.
  /// By default, it calls the xs method.
  @protected
  Widget sm(BuildContext context, BoxConstraints constraints) =>
      xs(context, constraints);

  /// The md method is called when the screen size is MD or larger.
  /// By default, it calls the sm method.
  @protected
  Widget md(BuildContext context, BoxConstraints constraints) =>
      sm(context, constraints);

  /// The lg method is called when the screen size is LG or larger.
  /// By default, it calls the md method.
  @protected
  Widget lg(BuildContext context, BoxConstraints constraints) =>
      md(context, constraints);

  /// The xl method is called when the screen size is XL or larger.
  /// By default, it calls the lg method.
  @protected
  Widget xl(BuildContext context, BoxConstraints constraints) =>
      lg(context, constraints);

  /// The xxl method is called when the screen size is XXL or larger.
  /// By default, it calls the xl method.
  @protected
  Widget xxl(BuildContext context, BoxConstraints constraints) =>
      xl(context, constraints);
}
