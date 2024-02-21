part of 'library.dart';

// ThemeSection typography(BuildContext context) {
//   final metrics = Theme.of(context).extension<ApodThemeData>()!;
//   final colors = Theme.of(context).colorScheme;
//   return ThemeSection(
//     title: 'Typography',
//     categories: [
//       ThemeCategory(
//         title: 'Regular',
//         children: [
//           ...metrics.typography.props.map<Widget>(
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
