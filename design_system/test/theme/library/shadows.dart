part of 'library.dart';

ThemeSection shadow(BuildContext context) {
  final metrics = Theme.of(context).extension<XMetricsData>()!;
  final colorScheme = Theme.of(context).colorScheme;

  return ThemeSection(
    title: 'Shadows',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...metrics.boxShadows.props.map<Widget>(
            (c) {
              final named = c as Named<BoxShadow>;
              return NamedCell(
                value: named,
                builder: (context, v, _) => Container(
                  height: 48,
                  width: 48,
                  margin: const EdgeInsets.all(64),
                  decoration: BoxDecoration(
                    color: colorScheme.onBackground,
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
