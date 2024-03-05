// part of x_metrics_data;

// class XSpacingsData extends Equatable {
//   final double none;
//   final double superSmall;
//   final double extraSmall;
//   final double small;
//   final double semiSmall;
//   final double medium;
//   final double semiLarge;
//   final double large;
//   final double extraLarge;
//   final double superLarge;

//   const XSpacingsData({
//     final double? none,
//     final double? superSmall,
//     final double? extraSmall,
//     final double? small,
//     final double? semiSmall,
//     final double? medium,
//     final double? semiLarge,
//     final double? large,
//     final double? extraLarge,
//     final double? superLarge,
//   })  : none = none ?? XStandardSizes.zero,
//         superSmall = superSmall ?? XAuxiliarySizes.x2,
//         extraSmall = extraSmall ?? XStandardSizes.x4,
//         small = small ?? XStandardSizes.x8,
//         semiSmall = semiSmall ?? XStandardSizes.x12,
//         medium = medium ?? XStandardSizes.x16,
//         semiLarge = semiLarge ?? XStandardSizes.x20,
//         large = large ?? XStandardSizes.x24,
//         extraLarge = extraLarge ?? XStandardSizes.x32,
//         superLarge = superLarge ?? XStandardSizes.x48;

//   XGapsData get gaps => XGapsData(this);

//   XEdgeInsetsData get edgeInsets => XEdgeInsetsData(this);

//   @override
//   List<Object?> get props => [
//         none.named('none'),
//         superSmall.named('superSmall'),
//         extraSmall.named('extraSmall'),
//         small.named('small'),
//         semiSmall.named('semiSmall'),
//         medium.named('medium'),
//         semiLarge.named('semiLarge'),
//         large.named('large'),
//         extraLarge.named('extraLarge'),
//         superLarge.named('superLarge'),
//       ];
// }

// class XGapsData extends Equatable {
//   final XSpacingsData _spacings;

//   const XGapsData(this._spacings);

//   Gap get none => Gap(_spacings.none);
//   Gap get superSmall => Gap(_spacings.superSmall);
//   Gap get extraSmall => Gap(_spacings.extraSmall);
//   Gap get small => Gap(_spacings.small);
//   Gap get semiSmall => Gap(_spacings.semiSmall);
//   Gap get medium => Gap(_spacings.medium);
//   Gap get semiLarge => Gap(_spacings.semiLarge);
//   Gap get large => Gap(_spacings.large);
//   Gap get extraLarge => Gap(_spacings.extraLarge);
//   Gap get superLarge => Gap(_spacings.superLarge);

//   @override
//   List<Object?> get props => [
//         _spacings,
//       ];
// }

// class XEdgeInsetsData extends Equatable {
//   final XSpacingsData _spacings;

//   const XEdgeInsetsData(this._spacings);

//   EdgeInsets get allNone => EdgeInsets.all(_spacings.none);
//   EdgeInsets get allSuperSmall => EdgeInsets.all(_spacings.superSmall);
//   EdgeInsets get allExtraSmall => EdgeInsets.all(_spacings.extraSmall);
//   EdgeInsets get allSmall => EdgeInsets.all(_spacings.small);
//   EdgeInsets get allSemiSmall => EdgeInsets.all(_spacings.semiSmall);
//   EdgeInsets get allMedium => EdgeInsets.all(_spacings.medium);
//   EdgeInsets get allSemiLarge => EdgeInsets.all(_spacings.semiLarge);
//   EdgeInsets get allLarge => EdgeInsets.all(_spacings.large);
//   EdgeInsets get allExtraLarge => EdgeInsets.all(_spacings.extraLarge);
//   EdgeInsets get allSuperLarge => EdgeInsets.all(_spacings.superLarge);

//   EdgeInsets get verticalNone => EdgeInsets.symmetric(vertical: _spacings.none);
//   EdgeInsets get verticalSuperSmall =>
//       EdgeInsets.symmetric(vertical: _spacings.superSmall);
//   EdgeInsets get verticalExtraSmall =>
//       EdgeInsets.symmetric(vertical: _spacings.extraSmall);
//   EdgeInsets get verticalSmall =>
//       EdgeInsets.symmetric(vertical: _spacings.small);
//   EdgeInsets get verticalSemiSmall =>
//       EdgeInsets.symmetric(vertical: _spacings.semiSmall);
//   EdgeInsets get verticalMedium =>
//       EdgeInsets.symmetric(vertical: _spacings.medium);
//   EdgeInsets get verticalSemiLarge =>
//       EdgeInsets.symmetric(vertical: _spacings.semiLarge);
//   EdgeInsets get verticalLarge =>
//       EdgeInsets.symmetric(vertical: _spacings.large);
//   EdgeInsets get verticalExtraLarge =>
//       EdgeInsets.symmetric(vertical: _spacings.extraLarge);
//   EdgeInsets get verticalSuperLarge =>
//       EdgeInsets.symmetric(vertical: _spacings.superLarge);

//   EdgeInsets get horizontalNone =>
//       EdgeInsets.symmetric(horizontal: _spacings.none);
//   EdgeInsets get horizontalSuperSmall =>
//       EdgeInsets.symmetric(horizontal: _spacings.superSmall);
//   EdgeInsets get horizontalExtraSmall =>
//       EdgeInsets.symmetric(horizontal: _spacings.extraSmall);
//   EdgeInsets get horizontalSmall =>
//       EdgeInsets.symmetric(horizontal: _spacings.small);
//   EdgeInsets get horizontalSemiSmall =>
//       EdgeInsets.symmetric(horizontal: _spacings.semiSmall);
//   EdgeInsets get horizontalMedium =>
//       EdgeInsets.symmetric(horizontal: _spacings.medium);
//   EdgeInsets get horizontalSemiLarge =>
//       EdgeInsets.symmetric(horizontal: _spacings.semiLarge);
//   EdgeInsets get horizontalLarge =>
//       EdgeInsets.symmetric(horizontal: _spacings.large);
//   EdgeInsets get horizontalExtraLarge =>
//       EdgeInsets.symmetric(horizontal: _spacings.extraLarge);
//   EdgeInsets get horizontalSuperLarge =>
//       EdgeInsets.symmetric(horizontal: _spacings.superLarge);

//   EdgeInsets only({
//     final XSpacing? left,
//     final XSpacing? top,
//     final XSpacing? right,
//     final XSpacing? bottom,
//   }) =>
//       EdgeInsets.only(
//         left:
//             (left ?? XSpacing.none).toDouble(_spacings) ?? XStandardSizes.zero,
//         top: (top ?? XSpacing.none).toDouble(_spacings) ?? XStandardSizes.zero,
//         right:
//             (right ?? XSpacing.none).toDouble(_spacings) ?? XStandardSizes.zero,
//         bottom: (bottom ?? XSpacing.none).toDouble(_spacings) ??
//             XStandardSizes.zero,
//       );

//   XPaddingsData get paddings => XPaddingsData(this);

//   @override
//   List<Object?> get props => [
//         _spacings,
//       ];
// }

// class XPaddingsData extends Equatable {
//   final XEdgeInsetsData _edgeInsets;
//   // final Widget? child;

//   const XPaddingsData(
//     this._edgeInsets,
//     // this.child,
//   );

//   Padding allNone({Widget? child}) => Padding(padding: _edgeInsets.allNone);
//   Padding allSuperSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.allSuperSmall, child: child);
//   Padding allExtraSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.allExtraSmall, child: child);
//   Padding allSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.allSmall, child: child);
//   Padding allSemiSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.allSemiSmall, child: child);
//   Padding allMedium({Widget? child}) =>
//       Padding(padding: _edgeInsets.allMedium, child: child);
//   Padding allSemiLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.allSemiLarge, child: child);
//   Padding allLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.allLarge, child: child);
//   Padding allExtraLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.allExtraLarge, child: child);
//   Padding allSuperLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.allSuperLarge, child: child);

//   Padding verticalNone({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalNone, child: child);
//   Padding verticalSuperSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalSuperSmall, child: child);
//   Padding verticalExtraSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalExtraSmall, child: child);
//   Padding verticalSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalSmall, child: child);
//   Padding verticalSemiSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalSemiSmall, child: child);
//   Padding verticalMedium({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalMedium, child: child);
//   Padding verticalSemiLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalSemiLarge, child: child);
//   Padding verticalLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalLarge, child: child);
//   Padding verticalExtraLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalExtraLarge, child: child);
//   Padding verticalSuperLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.verticalSuperLarge, child: child);

//   Padding horizontalNone({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalNone, child: child);
//   Padding horizontalSuperSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalSuperSmall, child: child);
//   Padding horizontalExtraSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalExtraSmall, child: child);
//   Padding horizontalSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalSmall, child: child);
//   Padding horizontalSemiSmall({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalSemiSmall, child: child);
//   Padding horizontalMedium({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalMedium, child: child);
//   Padding horizontalSemiLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalSemiLarge, child: child);
//   Padding horizontalLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalLarge, child: child);
//   Padding horizontalExtraLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalExtraLarge, child: child);
//   Padding horizontalSuperLarge({Widget? child}) =>
//       Padding(padding: _edgeInsets.horizontalSuperLarge, child: child);

//   @override
//   List<Object?> get props => [
//         _edgeInsets,
//       ];
// }

// enum XSpacing {
//   none,
//   superSmall,
//   extraSmall,
//   small,
//   semiSmall,
//   medium,
//   semiLarge,
//   large,
//   extraLarge,
//   superLarge,
// }

// extension XSpacingExtension on XSpacing {
//   double? toDouble(XSpacingsData? spacings) {
//     return switch (this) {
//       XSpacing.none => spacings?.none,
//       XSpacing.superSmall => spacings?.superSmall,
//       XSpacing.extraSmall => spacings?.extraSmall,
//       XSpacing.small => spacings?.small,
//       XSpacing.semiSmall => spacings?.semiSmall,
//       XSpacing.medium => spacings?.medium,
//       XSpacing.semiLarge => spacings?.semiLarge,
//       XSpacing.large => spacings?.large,
//       XSpacing.extraLarge => spacings?.extraLarge,
//       XSpacing.superLarge => spacings?.superLarge,
//     };
//   }
// }
