part of 'library.dart';

// ThemeSection colors(BuildContext context) {
//       final metrics = Theme.of(context).extension<ApodThemeData>()!;
//     final colorScheme = Theme.of(context).colorScheme;
//   return ThemeSection(
//     title: 'Colors',
//     categories: [
//       ThemeCategory(
//         title: 'Light',
//         children: [
//           ...colorScheme.props.map<Widget>(
//             (c) {
//               final named = c as Named<Color>;
//               return NamedCell(
//                 value: named,
//                 builder: (context, v, _) => Container(
//                   height: 32,
//                   width: 32,
//                   padding: const EdgeInsets.all(4),
//                   color: v,
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ],
//   );
// }
