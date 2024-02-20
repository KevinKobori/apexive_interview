part of 'library.dart';

// ThemeSection typography(BuildContext context) {
//   final theme = Theme.of(context).extension<ApodThemeData>()!;
//   final colors = Theme.of(context).colorScheme;
//   return ThemeSection(
//     title: 'Typography',
//     categories: [
//       ThemeCategory(
//         title: 'Regular',
//         children: [
//           ...theme.typography.props.map<Widget>(
//             (c) {
//               final named = c as Named<TextStyle>;
//               return NamedCell(
//                 value: named,
//                 builder: (context, v, _) => Text(
//                   'Hello!',
//                   style: named.value.copyWith(color: colors.onBackground),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ],
//   );
// }
