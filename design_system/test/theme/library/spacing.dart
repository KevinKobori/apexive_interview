part of 'library.dart';

ThemeSection spacing(BuildContext context) {
  final theme = Theme.of(context).extension<ApodThemeData>()!;
  return ThemeSection(
    title: 'Spacing',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.spacings.props.map<Widget>(
            (c) {
              final named = c as Named<double>;
              return NamedCell(
                value: named,
                builder: (context, v, _) => Container(
                  height: 24,
                  width: v,
                  color: theme.colors.accent,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
