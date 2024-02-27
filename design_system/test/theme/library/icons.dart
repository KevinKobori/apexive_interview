part of 'library.dart';

ThemeSection icons(BuildContext context) {
  final metrics = Theme.of(context).extension<ApodThemeData>()!;
  final colorScheme = Theme.of(context).colorScheme;
  final icons = metrics.icons;
  return ThemeSection(
    title: 'Icons',
    categories: [
      ThemeCategory(
        title: 'Small',
        children: [
          ...icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: c as Named<String>,
              builder: (context, v, _) => ApodIcon(
                v,
                color: colorScheme.onBackground,
                size: ApodIconSize.extraSmall,
              ),
            ),
          ),
        ],
      ),
      ThemeCategory(
        title: 'Large',
        children: [
          ...icons.characters.props.map<Widget>(
            (c) => NamedCell(
              value: c as Named<String>,
              builder: (context, v, _) => ApodIcon(
                v,
                color: colorScheme.onBackground,
                size: ApodIconSize.medium,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
