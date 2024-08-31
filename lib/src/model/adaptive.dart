part of '../../core/adaptive.dart';

AdaptiveSettings _adaptive = const AdaptiveSettings();

class Adaptive {
  static AdaptiveSettings get settings => _adaptive;

  /// Sets the default values for the [AdaptiveSettings] class.
  ///
  /// This method must be called before the [AdaptiveSettings] class is used.
  ///
  /// The default values are:
  /// - [xs] = [kXSMaxWidth] 480.0
  /// - [sm] = [kSMMaxWidth] 768.0
  /// - [md] = [kMDMaxWidth] 1024.0
  /// - [lg] = [kLGMaxWidth] 1440.0
  /// - [xl] = [kXLMaxWidth] 1920.0
  ///
  /// If any of the values are not provided, the default values will be used.
  ///
  /// The values must satisfy the following constraints:
  /// - [xl] > [lg]
  /// - [lg] > [md]
  /// - [md] > [sm]
  /// - [sm] > [xs]
  /// - [xs] > 0
  static setDefault({
    final double xs = kXSMaxWidth,
    final double sm = kSMMaxWidth,
    final double md = kMDMaxWidth,
    final double lg = kLGMaxWidth,
    final double xl = kXLMaxWidth,
  }) {
    assert(xl > lg, 'XL must be greater than LG');
    assert(lg > md, 'LG must be greater than MD');
    assert(md > sm, 'MD must be greater than SM');
    assert(sm > xs, 'SM must be greater than XS');
    assert(xs > 0, 'XS must be greater than 0');
    _adaptive = AdaptiveSettings(xs: xs, sm: sm, md: md, lg: lg, xl: xl);
  }
}
