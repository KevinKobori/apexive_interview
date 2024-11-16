// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:nasa_apod_design_system/nasa_apod_design_system.dart';

// class ApodGap extends StatelessWidget {
//   final XSpacing spacing;

//   const ApodGap(
//     this.spacing, {
//     super.key,
//   });

//   const ApodGap.none({
//     super.key,
//   }) : spacing = XSpacing.none;

//   const ApodGap.extraSmall({
//     super.key,
//   }) : spacing = XSpacing.extraSmall;

//   const ApodGap.small({
//     super.key,
//   }) : spacing = XSpacing.small;

//   const ApodGap.semiSmall({
//     super.key,
//   }) : spacing = XSpacing.semiSmall;

//   ApodGap.large({
//     super.key,
//   }) : spacing = metrics.xSpacings.large;

//   const ApodGap.extraLarge({
//     super.key,
//   }) : spacing = XSpacing.extraLarge;

//   const ApodGap.superLarge({
//     super.key,
//   }) : spacing = XSpacing.superLarge;

//   @override
//   Widget build(BuildContext context) {
//     final metrics = Theme.of(context).extension<ApodThemeData>()!;

//     return Gap(spacing.toDouble(metrics));
//   }
// }
