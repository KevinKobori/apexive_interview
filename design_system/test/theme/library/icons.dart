part of 'library.dart';

ThemeSection icons(BuildContext context) {
  final theme = Theme.of(context).extension<ApodThemeData>()!;
  final colors = Theme.of(context).colorScheme;
  final icons = theme.icons;
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
                color: colors.onBackground,
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
                color: colors.onBackground,
                size: ApodIconSize.medium,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
