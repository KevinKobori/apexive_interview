// import 'package:flutter/material.dart';

// enum ApodTextLevel {
//   bodyMedium,
//   bodyLarge,
//   titleSmall,
//   titleMedium,
//   titleLarge,
// }

// class ApodText extends StatelessWidget {
//   const ApodText(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.maxLines,
//     this.level = ApodTextLevel.bodyLarge,
//   });

//   const ApodText.bodyLarge(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.maxLines,
//   }) : level = ApodTextLevel.bodyLarge;

//   const ApodText.bodyMedium(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.maxLines,
//   }) : level = ApodTextLevel.bodyMedium;

//   const ApodText.titleLarge(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.maxLines,
//   }) : level = ApodTextLevel.titleLarge;

//   const ApodText.titleMedium(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.maxLines,
//   }) : level = ApodTextLevel.titleMedium;

//   const ApodText.titleSmall(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.maxLines,
//   }) : level = ApodTextLevel.titleSmall;

//   final String data;
//   final ApodTextLevel level;
//   final Color? color;
//   final double? fontSize;
//   final int? maxLines;

//   @override
//   Widget build(BuildContext context) {
//     final colors = Theme.of(context).colorScheme;
//     final textTheme = Theme.of(context).textTheme;
//     final color = this.color ?? colors.onBackground;
//     final style = () {
//       switch (level) {
//         case ApodTextLevel.bodyLarge:
//           return textTheme.bodyLarge;
//         case ApodTextLevel.bodyMedium:
//           return textTheme.bodyMedium;
//         case ApodTextLevel.titleLarge:
//           return textTheme.titleLarge;
//         case ApodTextLevel.titleMedium:
//           return textTheme.titleMedium;
//         case ApodTextLevel.titleSmall:
//           return textTheme.titleSmall;
//       }
//     }();
//     return Text(
//       data,
//       style: style!.copyWith(
//         color: color,
//         fontSize: fontSize,
//       ),
//       maxLines: maxLines,
//     );
//   }
// }
