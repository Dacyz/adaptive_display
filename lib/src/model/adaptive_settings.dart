part of '../../core/adaptive.dart';

/// Creates a new instance of [AdaptiveSettings] with the given values.
///
/// Defaults to:
/// - [xs] = [kXSMaxWidth] 480.0
/// - [sm] = [kSMMaxWidth] 768.0
/// - [md] = [kMDMaxWidth] 1024.0
/// - [lg] = [kLGMaxWidth] 1440.0
/// - [xl] = [kXLMaxWidth] 1920.0
final class AdaptiveSettings {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  const AdaptiveSettings({
    this.xs = kXSMaxWidth,
    this.sm = kSMMaxWidth,
    this.md = kMDMaxWidth,
    this.lg = kLGMaxWidth,
    this.xl = kXLMaxWidth,
  });

  /// Returns the maximum value between the given [width] and the
  /// current [AdaptiveSettings] values.
  ///
  /// This method is used to determine the maximum width of a widget
  /// based on the current adaptive values.
  ///
  /// For example, if the current adaptive values are:
  ///
  /// - `xs = 480.0`
  /// - `sm = 768.0`
  /// - `md = 1024.0`
  /// - `lg = 1440.0`
  /// - `xl = 1920.0`
  ///
  /// And the given [width] is 1200.0, the method will return 1440.0,
  /// which is the maximum value between 1200.0 and 1440.0.
  double max(double width) {
    // Check if the given width is less than the current xs value
    if (width < xs) return xs;
    // Check if the given width is less than the current sm value
    if (width < sm) return sm;
    // Check if the given width is less than the current md value
    if (width < md) return md;
    // Check if the given width is less than the current lg value
    if (width < lg) return lg;
    // Check if the given width is less than the current xl value
    if (width < xl) return xl;
    // If the given width is greater than or equal to the current xl value,
    // return the given width
    return width;
  }
}
