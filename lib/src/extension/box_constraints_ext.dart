part of '../../core/adaptive.dart';

extension BoxConstraintsExt on BoxConstraints {
  bool get isXS => maxWidth < _adaptive.xs;
  bool get isSM => maxWidth < _adaptive.sm;
  bool get isMD => maxWidth < _adaptive.md;
  bool get isLG => maxWidth < _adaptive.lg;
  bool get isXL => maxWidth < _adaptive.xl;
  bool get isXXL => maxWidth >= _adaptive.xl;
}
