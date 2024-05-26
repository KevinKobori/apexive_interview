// ignore_for_file: must_be_immutable, library_private_types_in_public_api

part of x_metrics_data;

class XBreakpointsData extends Equatable {
  final Breakpoint? _extraSmall;
  final Breakpoint? _small;
  final Breakpoint? _medium;
  final Breakpoint? _large;

  XBreakpointsData({
    final XAttribute<Breakpoint?>? extraSmall,
    final XAttribute<Breakpoint?>? small,
    final XAttribute<Breakpoint?>? medium,
    final XAttribute<Breakpoint?>? large,
  })  : _extraSmall = extraSmall == null
            ? const Breakpoint(
                minWidth: XStandardSizes.zero,
                maxWidth: XAuxiliarySizes.x599,
              )
            : extraSmall.value,
        _small = small == null
            ? const Breakpoint(
                minWidth: XAuxiliarySizes.x600,
                maxWidth: XAuxiliarySizes.x1023,
              )
            : small.value,
        _medium = medium == null
            ? const Breakpoint(
                minWidth: XAuxiliarySizes.x1024,
                maxWidth: XAuxiliarySizes.x1439,
              )
            : medium.value,
        _large = large == null
            ? const Breakpoint(
                minWidth: XAuxiliarySizes.x1440,
                maxWidth: double.infinity,
              )
            : large.value;

  Breakpoint get extraSmall =>
      _extraSmall ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'extraSmall', location: 'breakpoints')));
  Breakpoint get small =>
      _small ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'small', location: 'breakpoints')));
  Breakpoint get medium =>
      _medium ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'medium', location: 'breakpoints')));
  Breakpoint get large =>
      _large ??
      (throw UnsupportedError(getUnsupportedErrorMessage(
          attribute: 'large', location: 'breakpoints')));

  @override
  List<Object?> get props => [
        extraSmall.named('extraSmall'),
        small.named('small'),
        medium.named('medium'),
        large.named('large'),
      ];
}
