part of 'library.dart';

ThemeSection shadow(BuildContext context) {
  final theme = Theme.of(context).extension<ApodThemeData>()!;
  return ThemeSection(
    title: 'Shadows',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...theme.boxShadows.props.map<Widget>(
            (c) {
              final named = c as Named<BoxShadow>;
              return NamedCell(
                value: named,
                builder: (context, v, _) => Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.all(64),
                  decoration: BoxDecoration(
                    color: theme.colors.foreground,
                    boxShadow: [v],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
