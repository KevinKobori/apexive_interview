part of 'library.dart';

ThemeSection spacing(BuildContext context) {
  final metrics = Theme.of(context).extension<ApodThemeData>()!;
  final colorScheme = Theme.of(context).colorScheme;
  return ThemeSection(
    title: 'Spacing',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...metrics.spacings.props.map<Widget>(
            (c) {
              final named = c as Named<double>;
              return NamedCell(
                value: named,
                builder: (context, v, _) => Container(
                  height: 24,
                  width: v,
                  color: colorScheme.primary,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
