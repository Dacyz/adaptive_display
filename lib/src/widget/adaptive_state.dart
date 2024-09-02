part of '../adaptive_stateful_widget.dart';

@optionalTypeArgs
abstract class AdaptiveWrapState<T extends StatefulWidget> extends State<T> {
  /// By making the build method capable of wrapping the adaptive logic,
  /// the xs method becomes mandatory and is the first method to be called.
  @protected
  @override
  Widget build(BuildContext context) => adaptive;

  AdaptiveSettings get settings => Adaptive.settings;

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

  /// The xs method is the first one to be called, and it is the default
  /// method that is used when the screen size is XS.
  ///
  /// Default widget build of [AdaptiveWrapState]
  @protected
  Widget xs(BuildContext context);

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
