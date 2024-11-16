part of 'library.dart';

ThemeSection radius(BuildContext context) {
  final metrics = Theme.of(context).extension<XMetricsData>()!;
  final colorScheme = Theme.of(context).colorScheme;

  return ThemeSection(
    title: 'Border radius',
    categories: [
      ThemeCategory(
        title: 'Regular',
        children: [
          ...metrics.radius.props.map<Widget>(
            (c) {
              final named = c as Named<Radius>;
              return NamedCell(
                value: named,
                builder: (context, v, _) => Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: v),
                    color: colorScheme.primary,
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
