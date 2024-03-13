part of x_metrics_data;

class XElevationsData {
  final double? _level1;
  final double? _level2;
  final double? _level3;
  final double? _level4;
  final double? _level5;

  XElevationsData({
    final Optional<double?>? level1,
    final Optional<double?>? level2,
    final Optional<double?>? level3,
    final Optional<double?>? level4,
    final Optional<double?>? level5,
  })  : _level1 = level1 == null ? XAuxiliarySizes.x1 : level1.value,
        _level2 = level2 == null ? XAuxiliarySizes.x3 : level2.value,
        _level3 = level3 == null ? XAuxiliarySizes.x6 : level3.value,
        _level4 = level4 == null ? XStandardSizes.x8 : level4.value,
        _level5 = level5 == null ? XStandardSizes.x12 : level5.value;

  double get none => XStandardSizes.zero;
  double get level1 =>
      _level1 ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'level1', location: 'elevations')));
  double get level2 =>
      _level2 ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'level2', location: 'elevations')));
  double get level3 =>
      _level3 ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'level3', location: 'elevations')));
  double get level4 =>
      _level4 ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'level4', location: 'elevations')));
  double get level5 =>
      _level5 ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'level5', location: 'elevations')));
}
