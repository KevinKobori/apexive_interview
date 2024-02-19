part of 'library.dart';

ThemeSection icons(BuildContext context) {
  final theme = Theme.of(context).extension<ApodThemeData>()!;
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
                color: theme.colors.foreground,
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
                color: theme.colors.foreground,
                size: ApodIconSize.medium,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
