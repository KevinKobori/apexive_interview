// import 'package:flutter/widgets.dart';
// import 'package:nasa_apod_design_system/src/theme/theme.dart';
// import 'package:nasa_apod_design_system/src/widgets/base/base.dart';

// class DateLabel extends StatelessWidget {
//   const DateLabel(
//     this.value, {
//     super.key,
//   });

//   final String value;

//   @override
//   Widget build(BuildContext context) {
//     final theme = AppTheme.of(context);
//     return AppContainer(
//       decoration: BoxDecoration(
//         color: theme.colors.accent,
//         borderRadius: theme.radius.asBorderRadius().regular,
//       ),
//       padding: const AppEdgeInsets.symmetric(
//         vertical: AppGapSize.semiSmall,
//         horizontal: AppGapSize.medium,
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AppText.title3(
//             value.toString(),
//             color: theme.colors.accentOpposite,
//           ),
//           const AppGap.small(),
//           AppIcon.small(
//             theme.icons.characters.vikoin,
//             color: theme.colors.accentOpposite,
//           ),
//         ],
//       ),
//     );
//   }
// }
